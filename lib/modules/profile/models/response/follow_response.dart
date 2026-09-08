import 'package:freezed_annotation/freezed_annotation.dart';

import '../user_model.dart';

part 'follow_response.freezed.dart';
part 'follow_response.g.dart';

@freezed
abstract class FollowResponse with _$FollowResponse {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory FollowResponse({
    @Default(false) bool isFollowing,
    @Default(FollowStatsModel()) FollowStatsModel followerStats,
    @Default(FollowStatsModel()) FollowStatsModel followingStats,
  }) = _FollowResponse;

  factory FollowResponse.fromJson(Map<String, dynamic> json) =>
      _$FollowResponseFromJson(json);
}
