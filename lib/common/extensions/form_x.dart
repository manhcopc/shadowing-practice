import 'package:dio/dio.dart';

import '../../modules/profile/models/request/update_profile_request.dart';

extension UpdateProfileRequestExtension on UpdateProfileRequest {
  Future<FormData> toFormData() async {
    return FormData.fromMap({
      'displayName': displayName,
      'username': username,
      'phone': phone,
      'gender': gender,
      // Nếu `File` là một đường dẫn tệp, chuyển nó thành `MultipartFile`
      'file': file.isNotEmpty
          ? await MultipartFile.fromFile(file, filename: file.split('/').last)
          : null,
    });
  }
}
