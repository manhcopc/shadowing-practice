import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationWidget extends StatefulWidget {
  const AnimationWidget({
    super.key,
    this.isFullScreen = false,
    required this.animationPath,
    this.duration,
  });

  final bool isFullScreen;
  final String animationPath;
  final int? duration;

  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration != null
          ? Duration(milliseconds: widget.duration!)
          : null,
    );

    // Chỉ repeat nếu đã có duration
    if (widget.duration != null) {
      _controller.repeat();
    }
  }

  @override
  dispose() {
    if (_controller.isAnimating) {
      _controller.stop();
    }
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: !widget.isFullScreen ? Colors.black.withAlpha(1) : null,
      child: Center(
        child: Lottie.asset(
          widget.animationPath,
          controller: _controller,
          onLoaded: (composition) {
            _controller.duration = composition.duration;
            // Bắt đầu animation sau khi load xong
            _controller.repeat();
          },
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
