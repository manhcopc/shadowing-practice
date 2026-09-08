import 'dart:async';
import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';

import '../echo_foundation/echo_theme.dart';

class EchoAudioPlayerWidget extends StatefulWidget {
  const EchoAudioPlayerWidget({
    super.key,
    required this.duration,
    this.filePath,
    this.enabled = true,
    this.autoPlay = false,
    this.onCompleted,
    this.onPlayStarted,
  });

  final Duration duration;
  final String? filePath;
  final bool enabled;
  final bool autoPlay;
  final VoidCallback? onCompleted;
  final VoidCallback? onPlayStarted;

  @override
  State<EchoAudioPlayerWidget> createState() => _EchoAudioPlayerWidgetState();
}

class _EchoAudioPlayerWidgetState extends State<EchoAudioPlayerWidget> {
  final AudioPlayer _player = AudioPlayer();
  double _speed = 1;
  bool _ready = false;
  String? _error;
  String? _mockFilePath;
  StreamSubscription<PlayerState>? _stateSub;

  @override
  void initState() {
    super.initState();
    _load();
    _stateSub = _player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        widget.onCompleted?.call();
      }
      if (mounted) setState(() {});
    });
  }

  @override
  void didUpdateWidget(covariant EchoAudioPlayerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.filePath != widget.filePath) _load();
  }

  Future<void> _load() async {
    setState(() {
      _ready = false;
      _error = null;
    });
    try {
      if (widget.filePath != null && widget.filePath!.isNotEmpty) {
        final file = File(widget.filePath!);
        if (!await file.exists()) {
          throw const FileSystemException('Audio file not found');
        }
        await _player.setFilePath(file.path);
      } else {
        _mockFilePath = await EchoMockAudio.ensureMockAudioFile(widget.duration);
        await _player.setFilePath(_mockFilePath!);
      }
      await _player.setSpeed(_speed);
      if (mounted) setState(() => _ready = true);
      if (widget.autoPlay) {
        await _player.seek(Duration.zero);
        widget.onPlayStarted?.call();
        await _player.play();
      }
    } catch (error) {
      if (mounted) {
        setState(() {
          _ready = false;
          _error = 'Audio is not ready yet.';
        });
      }
    }
  }

  @override
  void dispose() {
    _stateSub?.cancel();
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final playing = _player.playing;
    final position = _player.position;
    final duration = _player.duration ?? widget.duration;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton.filled(
              tooltip: playing ? 'Pause' : 'Play',
              onPressed: widget.enabled && _ready
                  ? () async {
                      if (playing) {
                        await _player.pause();
                      } else {
                        if (position >= duration) await _player.seek(Duration.zero);
                        widget.onPlayStarted?.call();
                        await _player.play();
                      }
                    }
                  : null,
              icon: Icon(playing ? Icons.pause_rounded : Icons.play_arrow_rounded),
            ),
            IconButton(
              tooltip: 'Stop',
              onPressed: widget.enabled && _ready
                  ? () async {
                      await _player.stop();
                      await _player.seek(Duration.zero);
                    }
                  : null,
              icon: const Icon(Icons.stop_rounded),
            ),
            Expanded(
              child: StreamBuilder<Duration>(
                stream: _player.positionStream,
                builder: (context, snapshot) {
                  final pos = snapshot.data ?? Duration.zero;
                  return Slider(
                    value: pos.inMilliseconds.clamp(0, duration.inMilliseconds).toDouble(),
                    min: 0,
                    max: duration.inMilliseconds.toDouble().clamp(1, double.infinity),
                    onChanged: widget.enabled && _ready
                        ? (value) => _player.seek(Duration(milliseconds: value.round()))
                        : null,
                  );
                },
              ),
            ),
            Text('${_format(position)} / ${_format(duration)}', style: const TextStyle(color: EchoColors.secondaryText, fontSize: 12)),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(child: _Waveform(active: playing)),
            const SizedBox(width: 12),
            SegmentedButton<double>(
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              segments: const [
                ButtonSegment(value: 0.75, label: Text('0.75x')),
                ButtonSegment(value: 1, label: Text('1x')),
                ButtonSegment(value: 1.25, label: Text('1.25x')),
              ],
              selected: {_speed},
              onSelectionChanged: (value) {
                setState(() => _speed = value.first);
                _player.setSpeed(_speed);
              },
            ),
          ],
        ),
        if (_error != null) ...[
          const SizedBox(height: 8),
          Text(_error!, style: const TextStyle(color: Colors.red, fontSize: 12)),
        ],
      ],
    );
  }

  String _format(Duration duration) => '0:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}';

}

class EchoMockAudio {
  const EchoMockAudio._();

  static Future<String> ensureMockAudioFile(Duration duration) async {
    final tempDir = await getTemporaryDirectory();
    final seconds = duration.inSeconds.clamp(1, 12);
    final file = File('${tempDir.path}/echo-mock-native-$seconds.wav');
    if (!await file.exists()) {
      await file.writeAsBytes(_toneWav(Duration(seconds: seconds)), flush: true);
    }
    return file.path;
  }

  static Uint8List _toneWav(Duration duration) {
    const sampleRate = 16000;
    final samples = sampleRate * duration.inSeconds.clamp(1, 12);
    final byteRate = sampleRate * 2;
    final dataSize = samples * 2;
    final bytes = ByteData(44 + dataSize);
    void writeString(int offset, String value) {
      for (var i = 0; i < value.length; i++) {
        bytes.setUint8(offset + i, value.codeUnitAt(i));
      }
    }

    writeString(0, 'RIFF');
    bytes.setUint32(4, 36 + dataSize, Endian.little);
    writeString(8, 'WAVEfmt ');
    bytes.setUint32(16, 16, Endian.little);
    bytes.setUint16(20, 1, Endian.little);
    bytes.setUint16(22, 1, Endian.little);
    bytes.setUint32(24, sampleRate, Endian.little);
    bytes.setUint32(28, byteRate, Endian.little);
    bytes.setUint16(32, 2, Endian.little);
    bytes.setUint16(34, 16, Endian.little);
    writeString(36, 'data');
    bytes.setUint32(40, dataSize, Endian.little);
    for (var i = 0; i < samples; i++) {
      final t = i / sampleRate;
      final envelope = math.sin(math.pi * (i / samples)).clamp(0.08, 1.0);
      final tone = math.sin(2 * math.pi * 440 * t) * envelope;
      bytes.setInt16(44 + i * 2, (tone * 12000).round(), Endian.little);
    }
    return bytes.buffer.asUint8List();
  }
}

class _Waveform extends StatelessWidget {
  const _Waveform({required this.active});
  final bool active;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: Row(
        children: List.generate(22, (index) {
          final height = 10 + ((index * 17) % 30).toDouble();
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Align(
                alignment: Alignment.center,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  height: active && index.isEven ? height + 4 : height,
                  decoration: BoxDecoration(
                    color: active ? EchoColors.teal : EchoColors.border,
                    borderRadius: BorderRadius.circular(99),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
