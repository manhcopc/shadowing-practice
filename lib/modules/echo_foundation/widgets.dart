import 'package:flutter/material.dart';

import 'echo_theme.dart';

class EchoScaffold extends StatelessWidget {
  const EchoScaffold({
    super.key,
    required this.child,
    this.appBar,
    this.bottomNavigationBar,
  });

  final Widget child;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EchoColors.background,
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      body: SafeArea(child: child),
    );
  }
}

class EchoCard extends StatelessWidget {
  const EchoCard({super.key, required this.child, this.padding});

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding ?? const EdgeInsets.all(20),
      decoration: EchoTheme.cardDecoration(),
      child: child,
    );
  }
}

class EchoGradientButton extends StatelessWidget {
  const EchoGradientButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: onPressed == null ? 0.5 : 1,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: EchoTheme.gradient,
          borderRadius: BorderRadius.circular(18),
        ),
        child: FilledButton.icon(
          onPressed: onPressed,
          style: FilledButton.styleFrom(
            minimumSize: const Size.fromHeight(54),
            backgroundColor: Colors.transparent,
            disabledBackgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          icon: Icon(icon ?? Icons.arrow_forward_rounded),
          label: Text(label),
        ),
      ),
    );
  }
}

class EchoSectionTitle extends StatelessWidget {
  const EchoSectionTitle(this.title, {super.key, this.trailing});

  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: EchoColors.darkText,
              fontWeight: FontWeight.w800,
              fontSize: 18,
            ),
          ),
        ),
        ?trailing,
      ],
    );
  }
}

class EchoProgressBar extends StatelessWidget {
  const EchoProgressBar({super.key, required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(99),
      child: LinearProgressIndicator(
        value: value.clamp(0, 1),
        minHeight: 9,
        color: EchoColors.teal,
        backgroundColor: EchoColors.border,
      ),
    );
  }
}
