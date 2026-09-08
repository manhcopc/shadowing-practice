import 'package:flutter/material.dart';

/// A centralized bottom sheet utility class with consistent styling and behavior
class BottomSheetApp {
  /// Shows a modal bottom sheet with standard configuration
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    bool isScrollControlled = true,
    Color? backgroundColor,
    bool isDismissible = true,
    bool enableDrag = true,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    Color? barrierColor,
    bool useRootNavigator = false,
    RouteSettings? routeSettings,
    AnimationController? transitionAnimationController,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      builder: (context) => child,
      constraints: constraints ??
          BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
          ),
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor ?? Colors.transparent,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      barrierColor: barrierColor,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      transitionAnimationController: transitionAnimationController,
    );
  }

  /// Shows a modal bottom sheet with a custom builder
  static Future<T?> showWithBuilder<T>({
    required BuildContext context,
    required Widget Function(BuildContext) builder,
    bool isScrollControlled = true,
    Color? backgroundColor,
    bool isDismissible = true,
    bool enableDrag = true,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    Color? barrierColor,
    bool useRootNavigator = false,
    RouteSettings? routeSettings,
    AnimationController? transitionAnimationController,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      builder: builder,
      constraints: constraints ??
          BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
          ),
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor ?? Colors.transparent,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      barrierColor: barrierColor,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      transitionAnimationController: transitionAnimationController,
    );
  }
}
