// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_profile_request.freezed.dart';
part 'update_profile_request.g.dart';

@Freezed()
abstract class UpdateProfileRequest with _$UpdateProfileRequest {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory UpdateProfileRequest({
    @Default('') String displayName,
    @Default('') String username,
    @Default('') String phone,
    @Default(0) int gender,
    @Default('') String file,
  }) = _UpdateProfileRequest;

  factory UpdateProfileRequest.fromJson(dynamic json) =>
      _$UpdateProfileRequestFromJson(json);
}
