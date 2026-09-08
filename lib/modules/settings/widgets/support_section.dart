import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/generated/colors.gen.dart';
import '../../../core/language/generated/l10n.dart';
import '../../../core/services/rating_app/rating_app_controller.dart';
import '../../../core/utils/url_launcher_utils.dart';
import '../../../shared/widgets/app_text.dart';
import 'setting_item.dart';

class SupportSection extends StatelessWidget {
  const SupportSection({super.key});

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
                    const Color(0xFF60A5FA).withValues(alpha: 0.1),
                    const Color(0xFF60A5FA).withValues(alpha: 0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                Icons.help_outline,
                size: 20.sp,
                color: const Color(0xFF60A5FA),
              ),
            ),
            SizedBox(width: 12.w),
            AppText(
              S.of(context).support,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              textColor: isDark
                  ? ColorName.textBodyDark
                  : ColorName.textBodyLight,
            ),
          ],
        ),
        SizedBox(height: 20.h),

        // Support Grid
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 16.h,
          childAspectRatio: 0.95,
          children: [
            SettingItem(
              icon: Icons.help_outline,
              title: S.of(context).support,
              subtitle: 'Get help',
              iconColor: const Color(0xFF60A5FA),
              onTap: () {
                UrlLauncherUtils.launchSupportEmail();
              },
            ),
            SettingItem(
              icon: Icons.email_outlined,
              title: S.of(context).contactUs,
              subtitle: 'Send us message',
              iconColor: const Color(0xFF34D399),
              onTap: () {
                UrlLauncherUtils.launchFeedbackEmail();
              },
            ),
            SettingItem(
              icon: Icons.star_outline,
              title: S.of(context).rateUs,
              subtitle: 'Rate on store',
              iconColor: const Color(0xFFFBBF24),
              onTap: () async {
                final rateController = RateAppController(context);
                await rateController.initRateApp();
              },
            ),
          ],
        ),
      ],
    );
  }
}
