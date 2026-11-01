import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../../design/shadow_design_tokens.dart';
import '../../design/shadow_editorial_widgets.dart';
import '../pacer_calculator.dart';
import '../pacer_controller.dart';

class PacerReviewSheet extends StatefulWidget {
  const PacerReviewSheet({
    super.key,
    required this.controller,
    required this.onRetry,
  });

  final PacerController controller;
  final VoidCallback onRetry;

  @override
  State<PacerReviewSheet> createState() => _PacerReviewSheetState();
}

class _PacerReviewSheetState extends State<PacerReviewSheet> {
  final AudioPlayer _player = AudioPlayer();
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _initAudio();
  }

  Future<void> _initAudio() async {
    final path = widget.controller.recordedAudioPath;
    if (path == null) return;

    try {
      final d = await _player.setFilePath(path);
      if (d != null && mounted) {
        setState(() => _duration = d);
      }

      _player.positionStream.listen((pos) {
        if (mounted) setState(() => _position = pos);
      });

      _player.playerStateStream.listen((state) {
        if (mounted) {
          setState(() {
            _isPlaying = state.playing && state.processingState != ProcessingState.completed;
          });
        }
      });
    } catch (e) {
      debugPrint('Playback error: $e');
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  void _togglePlay() {
    if (_isPlaying) {
      _player.pause();
    } else {
      if (_position >= _duration) {
        _player.seek(Duration.zero);
      }
      _player.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    final timeFormatted = PacerCalculator.formatDurationMs(widget.controller.totalElapsedMs);
    final hasAudio = widget.controller.recordedAudioPath != null;

    return Container(
      padding: const EdgeInsets.all(ShadowSpacing.xl),
      decoration: const BoxDecoration(
        color: ShadowColors.paper,
        borderRadius: BorderRadius.vertical(top: ShadowRadius.lg),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: const BoxDecoration(
                  color: ShadowColors.divider,
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
              ),
            ),
            const SizedBox(height: ShadowSpacing.lg),

            // Header
            Row(
              children: [
                const Icon(Icons.check_circle_rounded, color: ShadowColors.success, size: 28),
                const SizedBox(width: ShadowSpacing.sm),
                Text(
                  'HOÀN THÀNH BÀI ĐỌC',
                  style: ShadowType.title.copyWith(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: ShadowSpacing.xs),
            Text(
              widget.controller.passage.title,
              style: ShadowType.displayMedium.copyWith(fontSize: 22),
            ),
            const SizedBox(height: ShadowSpacing.lg),

            // Stats grid
            Row(
              children: [
                Expanded(
                  child: _ReviewStatCard(
                    label: 'TỐC ĐỘ',
                    value: '${widget.controller.wpm}',
                    unit: 'WPM',
                  ),
                ),
                const SizedBox(width: ShadowSpacing.md),
                Expanded(
                  child: _ReviewStatCard(
                    label: 'THỜI GIAN',
                    value: timeFormatted,
                    unit: 'phút',
                  ),
                ),
                const SizedBox(width: ShadowSpacing.md),
                Expanded(
                  child: _ReviewStatCard(
                    label: 'SỐ CÂU',
                    value: '${widget.controller.totalSentences}',
                    unit: 'câu',
                  ),
                ),
              ],
            ),
            const SizedBox(height: ShadowSpacing.xl),

            // Audio Player (listen back to user recording)
            if (hasAudio) ...[
              const ShadowMetadataLabel('Nghe lại giọng đọc của bạn'),
              const SizedBox(height: ShadowSpacing.sm),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: ShadowColors.faint,
                  borderRadius: const BorderRadius.all(ShadowRadius.md),
                  border: Border.all(color: ShadowColors.divider),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(_isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled),
                      iconSize: 42,
                      color: ShadowColors.ink,
                      onPressed: _togglePlay,
                    ),
                    const SizedBox(width: ShadowSpacing.sm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LinearProgressIndicator(
                            value: _duration.inMilliseconds > 0
                                ? (_position.inMilliseconds / _duration.inMilliseconds).clamp(0.0, 1.0)
                                : 0.0,
                            backgroundColor: ShadowColors.divider,
                            valueColor: const AlwaysStoppedAnimation<Color>(ShadowColors.ink),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                PacerCalculator.formatDurationMs(_position.inMilliseconds),
                                style: ShadowType.metadata.copyWith(fontSize: 10),
                              ),
                              Text(
                                PacerCalculator.formatDurationMs(_duration.inMilliseconds),
                                style: ShadowType.metadata.copyWith(fontSize: 10),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: ShadowSpacing.xl),
            ],

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: widget.onRetry,
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      side: const BorderSide(color: ShadowColors.ink),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(ShadowRadius.sm),
                      ),
                    ),
                    child: Text(
                      'LUYỆN LẠI',
                      style: ShadowType.metadata.copyWith(color: ShadowColors.ink),
                    ),
                  ),
                ),
                const SizedBox(width: ShadowSpacing.md),
                Expanded(
                  child: ShadowCtaButton(
                    label: 'Đóng',
                    onPressed: () => context.router.maybePop(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ReviewStatCard extends StatelessWidget {
  const _ReviewStatCard({
    required this.label,
    required this.value,
    required this.unit,
  });

  final String label;
  final String value;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(ShadowSpacing.md),
      decoration: BoxDecoration(
        color: ShadowColors.faint,
        borderRadius: const BorderRadius.all(ShadowRadius.md),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: ShadowType.metadata.copyWith(fontSize: 9)),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: ShadowType.title.copyWith(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(width: 2),
              Text(unit, style: ShadowType.metadata.copyWith(fontSize: 9)),
            ],
          ),
        ],
      ),
    );
  }
}
