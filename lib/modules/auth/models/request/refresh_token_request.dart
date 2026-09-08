import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_token_request.freezed.dart';
part 'refresh_token_request.g.dart';

@freezed
abstract class RefreshTokenRequest with _$RefreshTokenRequest {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory RefreshTokenRequest({@Default('') String refreshToken}) =
      _RefreshTokenRequest;

  factory RefreshTokenRequest.fromJson(dynamic json) =>
      _$RefreshTokenRequestFromJson(json);
}
