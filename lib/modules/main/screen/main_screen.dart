import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/constants/constants.dart';
import '../../../common/generated/assets.gen.dart';
import '../../../core/app/app_router.dart';
import '../../../core/services/rating_app/rating_app_controller.dart';
import '../../../data/local/shared_prefs/storage.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Constants
  static const Duration _ratingDialogDelay = Duration(milliseconds: 500);
  static const double _iconSize = 32.0;
  static const double _selectedLabelFontSize = 12.0;
  static const double _unselectedLabelFontSize = 10.0;
  static const int _unselectedIconAlpha = 150;

  // Navigation configuration - mỗi item truyền iconAsset (SVG) HOẶC iconData (Flutter)
  static final List<_NavigationItem> _navigationItems = [
    _NavigationItem(
      index: 0,
      label: AppConstants.titleHome,
      iconAsset: Assets.icons.icHome,
    ),
    _NavigationItem(
      index: 1,
      label: 'Learn',
      iconData: Icons.school_rounded,
    ),
    _NavigationItem(
      index: 2,
      label: 'Progress',
      iconData: Icons.bar_chart_rounded,
    ),
    _NavigationItem(
      index: 3,
      label: AppConstants.titleProfile,
      iconData: Icons.person_rounded,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _initializeCubits();
    _checkAndShowRatingDialog();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [HomeRoute(), LearnRoute(), ProgressRoute(), ProfileRoute()],
      bottomNavigationBuilder: _buildBottomNavigationBar,
    );
  }

  // Private Methods

  Future<void> _initializeCubits() async {}

  void _checkAndShowRatingDialog() {
    if (!Storage.isSecondLaunch) return;

    Future.delayed(_ratingDialogDelay, () async {
      if (mounted) {
        final rateController = RateAppController(context);
        await rateController.showRateDialog();
      }
    });
  }

  Widget _buildBottomNavigationBar(
    BuildContext context,
    TabsRouter tabsRouter,
  ) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        if (isKeyboardVisible) return const SizedBox.shrink();

        return _buildThemedBottomNavigationBar(tabsRouter);
      },
    );
  }

  Widget _buildThemedBottomNavigationBar(TabsRouter tabsRouter) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Theme(
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        bottomNavigationBarTheme: _buildBottomNavigationBarTheme(),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: isDark
              ? colorScheme.surfaceContainerHighest
              : colorScheme.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withValues(alpha: 0.3)
                  : Colors.black.withValues(alpha: 0.08),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) => tabsRouter.setActiveIndex(index),
            selectedItemColor: _selectedIconColor,
            unselectedItemColor: _unselectedIconColor,
            backgroundColor: Colors.transparent,
            elevation: 0,
            items: _buildNavigationItems(tabsRouter.activeIndex),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarThemeData _buildBottomNavigationBarTheme() {
    final colorScheme = Theme.of(context).colorScheme;

    return BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      selectedItemColor: colorScheme.secondary,
      unselectedItemColor: colorScheme.onSurface.withAlpha(_unselectedIconAlpha),
      selectedLabelStyle: TextStyle(
        fontSize: _selectedLabelFontSize.sp,
        fontWeight: FontWeight.w600,
        color: colorScheme.secondary,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: _unselectedLabelFontSize.sp,
        fontWeight: FontWeight.w500,
        color: colorScheme.onSurface.withAlpha(_unselectedIconAlpha),
      ),
    );
  }

  List<BottomNavigationBarItem> _buildNavigationItems(int activeIndex) {
    return _navigationItems.map((item) {
      return BottomNavigationBarItem(
        icon: _buildNavigationIcon(
          iconAsset: item.iconAsset,
          iconData: item.iconData,
          isSelected: activeIndex == item.index,
        ),
        label: item.label,
      );
    }).toList();
  }

  Widget _buildNavigationIcon({
    SvgGenImage? iconAsset,
    IconData? iconData,
    required bool isSelected,
  }) {
    final color = isSelected ? _selectedIconColor : _unselectedIconColor;

    if (iconAsset != null) {
      return iconAsset.svg(
        width: _iconSize.r,
        height: _iconSize.r,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      );
    }

    return Icon(
      iconData ?? Icons.circle,
      size: _iconSize.r,
      color: color,
    );
  }

  // Getters - màu theo light/dark mode
  Color get _selectedIconColor => Theme.of(context).colorScheme.secondary;

  Color get _unselectedIconColor =>
      Theme.of(context).colorScheme.onSurface.withAlpha(_unselectedIconAlpha);
}

// Helper Classes

class _NavigationItem {
  const _NavigationItem({
    required this.index,
    required this.label,
    this.iconAsset,
    this.iconData,
  }) : assert(
          iconAsset != null || iconData != null,
          'Phải truyền iconAsset (SVG) hoặc iconData (Flutter)',
        );

  final int index;
  final String label;
  final SvgGenImage? iconAsset;
  final IconData? iconData;
}
