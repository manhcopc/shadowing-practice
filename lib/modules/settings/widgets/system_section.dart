import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rvc_mobile_application/common/extensions/extensions.dart';

import '../../../common/generated/colors.gen.dart';
import '../../../core/language/generated/l10n.dart';
import '../../../core/language/lang_cubit.dart';
import '../../../core/services/switch_theme/switch_theme_cubit.dart';
import '../../../shared/widgets/app_text.dart';
import '../../../shared/widgets/bottom_sheet_app.dart';
import 'bottom_sheet_language.dart';
import 'setting_item.dart';

class SystemSection extends StatelessWidget {
  const SystemSection({super.key});

  // Map language codes to display names
  static const languageNames = {
    'en': 'English',
    'vi': 'Tiếng Việt',
    'zh': '中文',
    'fr': 'Français',
    'de': 'Deutsch',
    'ja': '日本語',
    'ko': '한국어',
    'es': 'Español',
    'ru': 'Русский',
    'pt': 'Português',
    'it': 'Italiano',
    'ar': 'العربية',
    'hi': 'हिन्दी',
    'bn': 'বাংলা',
    'th': 'ไทย',
    'id': 'Bahasa Indonesia',
    'ms': 'Bahasa Melayu',
    'nl': 'Nederlands',
    'tr': 'Türkçe',
    'pl': 'Polski',
    'sv': 'Svenska',
    'uk': 'Українська',
    'ro': 'Română',
    'cs': 'Čeština',
    'hu': 'Magyar',
    'el': 'Ελληνικά',
    'da': 'Dansk',
    'fi': 'Suomi',
    'no': 'Norsk',
    'he': 'עברית',
    'bg': 'Български',
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF10B981).withValues(alpha: 0.1),
                    const Color(0xFF10B981).withValues(alpha: 0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                Icons.system_security_update_outlined,
                size: 20.sp,
                color: const Color(0xFF10B981),
              ),
            ),
            SizedBox(width: 12.w),
            AppText(
              "Cài đặt hệ thống",
              fontSize: 22,
              fontWeight: FontWeight.bold,
              textColor: isDark
                  ? ColorName.textBodyDark
                  : ColorName.textBodyLight,
            ),
          ],
        ),
        SizedBox(height: 20.h),

        // Theme Grid
        BlocBuilder<SwitchThemeCubit, SwitchThemeState>(
          builder: (context, themeState) {
            final isCurrentlyDark = themeState.themeMode == ThemeMode.dark;
            return GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 0.95,
              children: [
                SettingItem(
                  icon: Icons.dark_mode_outlined,
                  title: S.of(context).darkMode,
                  subtitle: isCurrentlyDark ? 'Active' : 'Tap to enable',
                  iconColor: const Color(0xFF6366F1),
                  backgroundColor: isCurrentlyDark
                      ? const Color(0xFF6366F1).withValues(alpha: 0.1)
                      : null,
                  onTap: () {
                    context.read<SwitchThemeCubit>().setThemeMode(
                      ThemeMode.dark,
                    );
                  },
                ),
                SettingItem(
                  icon: Icons.light_mode_outlined,
                  title: S.of(context).lightMode,
                  subtitle: !isCurrentlyDark ? 'Active' : 'Tap to enable',
                  iconColor: const Color(0xFFF59E0B),
                  backgroundColor: !isCurrentlyDark
                      ? const Color(0xFFF59E0B).withValues(alpha: 0.1)
                      : null,
                  onTap: () {
                    context.read<SwitchThemeCubit>().setThemeMode(
                      ThemeMode.light,
                    );
                  },
                ),
                BlocBuilder<LangCubit, Locale>(
                  builder: (context, currentLocale) {
                    final currentLanguageName =
                        languageNames[currentLocale.languageCode] ?? 'English';

                    return SettingItem(
                      icon: Icons.translate_outlined,
                      title: S.of(context).changeLanguage,
                      subtitle: currentLanguageName,
                      iconColor: const Color(0xFF10B981),
                      onTap: () {
                        BottomSheetApp.showWithBuilder(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: context.colorScheme.surface,
                          builder: (context) =>
                              const LanguageSelectionBottomSheet(),
                        );
                      },
                    );
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
