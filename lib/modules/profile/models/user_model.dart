import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.g.dart';
part 'user_model.freezed.dart';

@freezed
abstract class UserModel with _$UserModel {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory UserModel({
    @Default("") String userId,
    @Default("") String username,
    @Default("") String email,
    @Default("") String displayName,
    @Default("") String description,
    @Default("") String profilePic,
    String? birthday,
    @Default("") String phone,
    @Default("") String methodSignUp,
    @Default("user") String role,
    int? gender,
    @Default("") String fcmToken,
    @Default(false) bool isActive,
    @Default([]) List<String> scannedData,
    @Default("") String password,
    @Default("") String createdAt,
    @Default(false) bool isPublic,
    List<UserModel>? followers,
    List<UserModel>? following,
    FollowStatsModel? stats,
    @Default(false) bool isFollowing, // Use in context of another user
    @Default(EntitlementUserModel()) EntitlementUserModel entitlement,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
abstract class MetaDataUser with _$MetaDataUser {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory MetaDataUser({
    @Default('') String accessToken,
    @Default('') String refreshToken,
  }) = _MetaDataUser;

  factory MetaDataUser.fromJson(Map<String, dynamic> json) =>
      _$MetaDataUserFromJson(json);
}

@freezed
abstract class EntitlementUserModel with _$EntitlementUserModel {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory EntitlementUserModel({
    @Default(false) bool premium,
    @Default(0) int activeUntilMillis,
    @Default(false) bool willRenew,
    @Default("") String productId,
    @Default("") String sourcePlatform,
    @Default("") String tier,
  }) = _EntitlementUserModel;

  factory EntitlementUserModel.fromJson(Map<String, dynamic> json) =>
      _$EntitlementUserModelFromJson(json);
}

@freezed
abstract class FollowStatsModel with _$FollowStatsModel {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory FollowStatsModel({
    @Default(0) int countFollowers,
    @Default(0) int countFollowing,
  }) = _FollowStatsModel;

  factory FollowStatsModel.fromJson(Map<String, dynamic> json) =>
      _$FollowStatsModelFromJson(json);
}
