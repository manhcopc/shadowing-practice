import 'package:freezed_annotation/freezed_annotation.dart';

part 'toggle_public_response.freezed.dart';
part 'toggle_public_response.g.dart';

@freezed
abstract class TogglePublicResponse with _$TogglePublicResponse {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory TogglePublicResponse({@Default(false) bool isPublic}) =
      _TogglePublicResponse;

  factory TogglePublicResponse.fromJson(Map<String, dynamic> json) =>
      _$TogglePublicResponseFromJson(json);
}
