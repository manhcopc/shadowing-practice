import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';

import '../../../common/constants/constants.dart';
import '../../../core/language/generated/l10n.dart';
import '../../../shared/widgets/app_text.dart';

class RateAppController {
  final BuildContext context;
  RateMyApp? rateMyApp;

  RateAppController(this.context) {
    rateMyApp = RateMyApp(
      googlePlayIdentifier: AppConstants.androidPackageName,
      appStoreIdentifier: AppConstants.appStoreId,
      minDays: 0,
      minLaunches: 0,
      remindDays: 0,
      remindLaunches: 0,
    );
  }

  Future<void> initRateApp() async {
    await rateMyApp!.init();
    if (rateMyApp!.shouldOpenDialog) {
      showRateDialog();
    }
  }

  Future<void> showRateDialog() async {
    // RateMyApp is already initialized before this method is called
    if (!context.mounted) return;

    final navigatorContext = Navigator.of(context, rootNavigator: true).context;
    rateMyApp!.showStarRateDialog(
      navigatorContext,
      title: S.of(context).titleRateApp,
      message: S.of(context).messageRateApp,
      actionsBuilder: (context, stars) => [
        TextButton(
          onPressed: () async {
            stars = stars ?? 0;

            if (stars! < 4) {
              Navigator.pop(context);
              // Gọi event khi người dùng không rate
              await rateMyApp!.callEvent(RateMyAppEventType.laterButtonPressed);
            } else {
              Navigator.pop<RateMyAppDialogButton>(
                context,
                RateMyAppDialogButton.rate,
              );
              await rateMyApp!.callEvent(RateMyAppEventType.rateButtonPressed);

              if ((await rateMyApp!.isNativeReviewDialogSupported) ?? false) {
                await rateMyApp!.launchNativeReviewDialog();
              } else {
                rateMyApp!.launchStore();
              }
            }
          },
          child: AppText(S.of(context).buttonOk, textColor: Colors.amber),
        ),
      ],
      ignoreNativeDialog: Platform.isAndroid,
      dialogStyle: const DialogStyle(
        titleAlign: TextAlign.center,
        messageAlign: TextAlign.center,
        messagePadding: EdgeInsets.only(bottom: 20),
      ),
      starRatingOptions: const StarRatingOptions(),
      onDismissed: () async {
        // Xử lý khi dialog bị đóng mà không tương tác
        try {
          await rateMyApp!.callEvent(RateMyAppEventType.laterButtonPressed);
        } catch (e) {
          // Ignore error nếu có vấn đề với callEvent
          debugPrint('Error calling laterButtonPressed: $e');
        }
      },
    );
  }
}
