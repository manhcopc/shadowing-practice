import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../common/generated/assets.gen.dart';
import '../../core/language/generated/l10n.dart';
import 'app_text.dart';

/// DEPRECATED: Sử dụng DialogService.showError() thay thế
/// Widget này được giữ lại để tương thích ngược
@Deprecated('Sử dụng DialogService.showError() để hiển thị error dialog')
class DialogError extends StatelessWidget {
  const DialogError({
    super.key,
    this.isErrorNetwork = true,
    required this.onNetworkPressed,
    required this.onErrorPressed,
    required this.title,
    required this.content,
    this.titleButton,
    this.tag = 'error_dialog',
  });

  final bool isErrorNetwork;
  final VoidCallback onNetworkPressed;
  final VoidCallback onErrorPressed;
  final String title;
  final String content;
  final String? titleButton;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), // Bo góc popup
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Chỉ chiếm không gian cần thiết
          children: [
            Assets.icons.icError.image(width: 60, height: 60),
            const SizedBox(height: 16),
            AppText(title, fontSize: 20, fontWeight: FontWeight.w700),
            const SizedBox(height: 8),
            AppText(
              content,
              textColor: Colors.grey[600],
              fontSize: 14,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (!isErrorNetwork)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: OutlinedButton(
                        onPressed: () => SmartDialog.dismiss(tag: tag),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: AppText(
                          S.of(context).cancel,
                          textColor: Colors.red,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (isErrorNetwork) {
                        onNetworkPressed();
                      } else {
                        onErrorPressed();
                      }
                      SmartDialog.dismiss(tag: tag);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: AppText(
                      titleButton ?? S.of(context).exit,
                      textColor: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
