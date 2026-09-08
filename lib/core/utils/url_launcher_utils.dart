import 'package:url_launcher/url_launcher.dart';

import '../../common/constants/constants.dart';

class UrlLauncherUtils {
  /// Launch email with predefined subject
  static void launchEmail({
    String email = 'binh01t2@gmail.com',
    String subject = 'Feedback for ${AppConstants.nameApp}  App',
  }) {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: _encodeQueryParameters(<String, String>{'subject': subject}),
    );
    launchUrl(emailLaunchUri);
  }

  /// Launch URL
  static void launchUrlString(String url) {
    launchUrl(Uri.parse(url));
  }

  /// Launch privacy policy URL
  static void launchPrivacyPolicy() {
    launchUrlString(
      'https://freeaiutilities.mcanswers.ai/skinsort/privacy-policy',
    );
  }

  /// Launch terms of service URL
  static void launchTermsOfService() {
    launchUrlString(
      'https://freeaiutilities.mcanswers.ai/skinsort/terms-of-use',
    );
  }

  /// Launch support email
  static void launchSupportEmail() {
    launchEmail(subject: 'Support Request for ${AppConstants.nameApp} App');
  }

  /// Launch feedback email
  static void launchFeedbackEmail() {
    launchEmail(subject: 'Feedback for ${AppConstants.nameApp} App');
  }

  /// Encode query parameters for URL
  static String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map(
          (MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
        )
        .join('&');
  }
}
