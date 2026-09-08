import 'package:flutter/material.dart';

import 'shadow_design_tokens.dart';

class ShadowEditorialScaffold extends StatelessWidget {
  const ShadowEditorialScaffold({
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
      backgroundColor: ShadowColors.ivory,
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      body: SafeArea(child: child),
    );
  }
}

class ShadowMetadataLabel extends StatelessWidget {
  const ShadowMetadataLabel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text.toUpperCase(), style: ShadowType.metadata);
  }
}

class ShadowEditorialHeader extends StatelessWidget {
  const ShadowEditorialHeader({
    super.key,
    required this.wordmark,
    required this.metadata,
    this.trailing,
  });

  final String wordmark;
  final String metadata;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        ShadowSpacing.lg,
        ShadowSpacing.md,
        ShadowSpacing.lg,
        ShadowSpacing.sm,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  wordmark,
                  style: ShadowType.title.copyWith(letterSpacing: 1.2),
                ),
              ),
              ?trailing,
            ],
          ),
          const SizedBox(height: ShadowSpacing.md),
          Row(
            children: [
              Expanded(child: ShadowMetadataLabel(metadata)),
              const SizedBox(width: ShadowSpacing.md),
              const Expanded(child: ShadowDivider()),
            ],
          ),
        ],
      ),
    );
  }
}

class ShadowDivider extends StatelessWidget {
  const ShadowDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(height: 1, thickness: 1, color: ShadowColors.divider);
  }
}

class ShadowPanel extends StatelessWidget {
  const ShadowPanel({super.key, required this.child, this.padding});

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding ?? const EdgeInsets.all(ShadowSpacing.lg),
      decoration: ShadowDecorations.panel(),
      child: child,
    );
  }
}

class ShadowCtaButton extends StatelessWidget {
  const ShadowCtaButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        minimumSize: const Size.fromHeight(52),
        backgroundColor: ShadowColors.cta,
        foregroundColor: ShadowColors.paper,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(ShadowRadius.sm),
        ),
        textStyle: ShadowType.metadata.copyWith(color: ShadowColors.paper),
      ),
      child: Text(label.toUpperCase()),
    );
  }
}

class ShadowPill extends StatelessWidget {
  const ShadowPill({
    super.key,
    required this.label,
    this.selected = false,
    this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: selected,
      child: InkWell(
        borderRadius: const BorderRadius.all(ShadowRadius.sm),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: ShadowSpacing.md,
            vertical: ShadowSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: selected ? ShadowColors.ink : Colors.transparent,
            border: Border.all(color: ShadowColors.divider),
            borderRadius: const BorderRadius.all(ShadowRadius.sm),
          ),
          child: Text(
            label.toUpperCase(),
            style: ShadowType.metadata.copyWith(
              color: selected ? ShadowColors.paper : ShadowColors.muted,
            ),
          ),
        ),
      ),
    );
  }
}
