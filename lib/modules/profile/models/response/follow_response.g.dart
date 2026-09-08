// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FollowResponse _$FollowResponseFromJson(Map<String, dynamic> json) =>
    _FollowResponse(
      isFollowing: json['isFollowing'] as bool? ?? false,
      followerStats: json['followerStats'] == null
          ? const FollowStatsModel()
          : FollowStatsModel.fromJson(
              json['followerStats'] as Map<String, dynamic>,
            ),
      followingStats: json['followingStats'] == null
          ? const FollowStatsModel()
          : FollowStatsModel.fromJson(
              json['followingStats'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$FollowResponseToJson(_FollowResponse instance) =>
    <String, dynamic>{
      'isFollowing': instance.isFollowing,
      'followerStats': instance.followerStats.toJson(),
      'followingStats': instance.followingStats.toJson(),
    };
