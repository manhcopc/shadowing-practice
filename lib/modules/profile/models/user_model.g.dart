// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  userId: json['userId'] as String? ?? "",
  username: json['username'] as String? ?? "",
  email: json['email'] as String? ?? "",
  displayName: json['displayName'] as String? ?? "",
  description: json['description'] as String? ?? "",
  profilePic: json['profilePic'] as String? ?? "",
  birthday: json['birthday'] as String?,
  phone: json['phone'] as String? ?? "",
  methodSignUp: json['methodSignUp'] as String? ?? "",
  role: json['role'] as String? ?? "user",
  gender: (json['gender'] as num?)?.toInt(),
  fcmToken: json['fcmToken'] as String? ?? "",
  isActive: json['isActive'] as bool? ?? false,
  scannedData:
      (json['scannedData'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  password: json['password'] as String? ?? "",
  createdAt: json['createdAt'] as String? ?? "",
  isPublic: json['isPublic'] as bool? ?? false,
  followers: (json['followers'] as List<dynamic>?)
      ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  following: (json['following'] as List<dynamic>?)
      ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  stats: json['stats'] == null
      ? null
      : FollowStatsModel.fromJson(json['stats'] as Map<String, dynamic>),
  isFollowing: json['isFollowing'] as bool? ?? false,
  entitlement: json['entitlement'] == null
      ? const EntitlementUserModel()
      : EntitlementUserModel.fromJson(
          json['entitlement'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'email': instance.email,
      'displayName': instance.displayName,
      'description': instance.description,
      'profilePic': instance.profilePic,
      'birthday': instance.birthday,
      'phone': instance.phone,
      'methodSignUp': instance.methodSignUp,
      'role': instance.role,
      'gender': instance.gender,
      'fcmToken': instance.fcmToken,
      'isActive': instance.isActive,
      'scannedData': instance.scannedData,
      'password': instance.password,
      'createdAt': instance.createdAt,
      'isPublic': instance.isPublic,
      'followers': instance.followers?.map((e) => e.toJson()).toList(),
      'following': instance.following?.map((e) => e.toJson()).toList(),
      'stats': instance.stats?.toJson(),
      'isFollowing': instance.isFollowing,
      'entitlement': instance.entitlement.toJson(),
    };

_MetaDataUser _$MetaDataUserFromJson(Map<String, dynamic> json) =>
    _MetaDataUser(
      accessToken: json['accessToken'] as String? ?? '',
      refreshToken: json['refreshToken'] as String? ?? '',
    );

Map<String, dynamic> _$MetaDataUserToJson(_MetaDataUser instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };

_EntitlementUserModel _$EntitlementUserModelFromJson(
  Map<String, dynamic> json,
) => _EntitlementUserModel(
  premium: json['premium'] as bool? ?? false,
  activeUntilMillis: (json['activeUntilMillis'] as num?)?.toInt() ?? 0,
  willRenew: json['willRenew'] as bool? ?? false,
  productId: json['productId'] as String? ?? "",
  sourcePlatform: json['sourcePlatform'] as String? ?? "",
  tier: json['tier'] as String? ?? "",
);

Map<String, dynamic> _$EntitlementUserModelToJson(
  _EntitlementUserModel instance,
) => <String, dynamic>{
  'premium': instance.premium,
  'activeUntilMillis': instance.activeUntilMillis,
  'willRenew': instance.willRenew,
  'productId': instance.productId,
  'sourcePlatform': instance.sourcePlatform,
  'tier': instance.tier,
};

_FollowStatsModel _$FollowStatsModelFromJson(Map<String, dynamic> json) =>
    _FollowStatsModel(
      countFollowers: (json['countFollowers'] as num?)?.toInt() ?? 0,
      countFollowing: (json['countFollowing'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$FollowStatsModelToJson(_FollowStatsModel instance) =>
    <String, dynamic>{
      'countFollowers': instance.countFollowers,
      'countFollowing': instance.countFollowing,
    };
