// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '/common/extensions/context_x.dart';

import '../../../common/generated/assets.gen.dart';

class SplashPlaceHolder extends StatefulWidget {
  const SplashPlaceHolder({super.key});

  @override
  _SplashPlaceHolderState createState() => _SplashPlaceHolderState();
}

class _SplashPlaceHolderState extends State<SplashPlaceHolder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true); // Lặp lại liên tục và đảo ngược

    _scaleAnimation = Tween<double>(
      begin: 0.9,
      end: 1.1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Assets.images.logoApp.image(height: 300, width: 300),
        ),
      ),
    );
  }
}
