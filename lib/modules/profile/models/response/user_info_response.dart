import 'package:freezed_annotation/freezed_annotation.dart';

import '../user_model.dart';

part 'user_info_response.freezed.dart';
part 'user_info_response.g.dart';

@freezed
abstract class UserInfoResponse with _$UserInfoResponse {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory UserInfoResponse({
    @Default(UserModel()) UserModel userInfo,
  }) = _UserInfoResponse;

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$UserInfoResponseFromJson(json);
}
