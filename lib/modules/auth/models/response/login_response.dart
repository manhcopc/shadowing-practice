import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../profile/models/user_model.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
abstract class LoginResponse with _$LoginResponse {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory LoginResponse({
    @Default(UserModel()) UserModel userInfo,
    @Default(MetaDataUser()) MetaDataUser meta,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
