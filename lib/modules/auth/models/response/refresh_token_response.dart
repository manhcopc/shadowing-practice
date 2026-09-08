import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../profile/models/user_model.dart';

part 'refresh_token_response.freezed.dart';
part 'refresh_token_response.g.dart';

@freezed
abstract class RefreshTokenResponse with _$RefreshTokenResponse {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory RefreshTokenResponse({
    @Default(MetaDataUser()) MetaDataUser meta,
  }) = _RefreshTokenResponse;

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseFromJson(json);
}
