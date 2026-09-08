import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/generated/colors.gen.dart';
import '../../../core/language/generated/l10n.dart';
import '../../../core/utils/url_launcher_utils.dart';
import '../../../shared/widgets/app_text.dart';
import 'setting_item.dart';

class LegalSection extends StatelessWidget {
  const LegalSection({super.key});

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
                    const Color(0xFF8B5CF6).withValues(alpha: 0.1),
                    const Color(0xFF8B5CF6).withValues(alpha: 0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                Icons.gavel_outlined,
                size: 20.sp,
                color: const Color(0xFF8B5CF6),
              ),
            ),
            SizedBox(width: 12.w),
            AppText(
              S.of(context).legal,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              textColor: isDark
                  ? ColorName.textBodyDark
                  : ColorName.textBodyLight,
            ),
          ],
        ),
        SizedBox(height: 20.h),

        // Legal Grid
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 16.h,
          childAspectRatio: 0.95,
          children: [
            SettingItem(
              icon: Icons.privacy_tip_outlined,
              title: S.of(context).privacyPolicy,
              subtitle: 'Privacy terms',
              iconColor: const Color(0xFF8B5CF6),
              onTap: () {
                UrlLauncherUtils.launchPrivacyPolicy();
              },
            ),
            SettingItem(
              icon: Icons.description_outlined,
              title: S.of(context).termsOfService,
              subtitle: 'Terms & conditions',
              iconColor: const Color(0xFF8B5CF6),
              onTap: () {
                UrlLauncherUtils.launchTermsOfService();
              },
            ),
          ],
        ),
      ],
    );
  }
}
