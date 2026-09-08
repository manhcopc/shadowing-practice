// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_request.freezed.dart';
part 'signup_request.g.dart';

@freezed
abstract class SignUpRequest with _$SignUpRequest {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory SignUpRequest({
    @Default('') String username,
    @Default('') String email,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String password,
  }) = _SignUpRequest;

  // Phương thức để chuyển đổi từ JSON
  factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestFromJson(json);
}
