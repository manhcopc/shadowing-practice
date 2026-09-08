// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {

 String get userId; String get username; String get email; String get displayName; String get description; String get profilePic; String? get birthday; String get phone; String get methodSignUp; String get role; int? get gender; String get fcmToken; bool get isActive; List<String> get scannedData; String get password; String get createdAt; bool get isPublic; List<UserModel>? get followers; List<UserModel>? get following; FollowStatsModel? get stats; bool get isFollowing;// Use in context of another user
 EntitlementUserModel get entitlement;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.description, description) || other.description == description)&&(identical(other.profilePic, profilePic) || other.profilePic == profilePic)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.methodSignUp, methodSignUp) || other.methodSignUp == methodSignUp)&&(identical(other.role, role) || other.role == role)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other.scannedData, scannedData)&&(identical(other.password, password) || other.password == password)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&const DeepCollectionEquality().equals(other.followers, followers)&&const DeepCollectionEquality().equals(other.following, following)&&(identical(other.stats, stats) || other.stats == stats)&&(identical(other.isFollowing, isFollowing) || other.isFollowing == isFollowing)&&(identical(other.entitlement, entitlement) || other.entitlement == entitlement));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,userId,username,email,displayName,description,profilePic,birthday,phone,methodSignUp,role,gender,fcmToken,isActive,const DeepCollectionEquality().hash(scannedData),password,createdAt,isPublic,const DeepCollectionEquality().hash(followers),const DeepCollectionEquality().hash(following),stats,isFollowing,entitlement]);

@override
String toString() {
  return 'UserModel(userId: $userId, username: $username, email: $email, displayName: $displayName, description: $description, profilePic: $profilePic, birthday: $birthday, phone: $phone, methodSignUp: $methodSignUp, role: $role, gender: $gender, fcmToken: $fcmToken, isActive: $isActive, scannedData: $scannedData, password: $password, createdAt: $createdAt, isPublic: $isPublic, followers: $followers, following: $following, stats: $stats, isFollowing: $isFollowing, entitlement: $entitlement)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 String userId, String username, String email, String displayName, String description, String profilePic, String? birthday, String phone, String methodSignUp, String role, int? gender, String fcmToken, bool isActive, List<String> scannedData, String password, String createdAt, bool isPublic, List<UserModel>? followers, List<UserModel>? following, FollowStatsModel? stats, bool isFollowing, EntitlementUserModel entitlement
});


$FollowStatsModelCopyWith<$Res>? get stats;$EntitlementUserModelCopyWith<$Res> get entitlement;

}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? username = null,Object? email = null,Object? displayName = null,Object? description = null,Object? profilePic = null,Object? birthday = freezed,Object? phone = null,Object? methodSignUp = null,Object? role = null,Object? gender = freezed,Object? fcmToken = null,Object? isActive = null,Object? scannedData = null,Object? password = null,Object? createdAt = null,Object? isPublic = null,Object? followers = freezed,Object? following = freezed,Object? stats = freezed,Object? isFollowing = null,Object? entitlement = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,profilePic: null == profilePic ? _self.profilePic : profilePic // ignore: cast_nullable_to_non_nullable
as String,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as String?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,methodSignUp: null == methodSignUp ? _self.methodSignUp : methodSignUp // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int?,fcmToken: null == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,scannedData: null == scannedData ? _self.scannedData : scannedData // ignore: cast_nullable_to_non_nullable
as List<String>,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,followers: freezed == followers ? _self.followers : followers // ignore: cast_nullable_to_non_nullable
as List<UserModel>?,following: freezed == following ? _self.following : following // ignore: cast_nullable_to_non_nullable
as List<UserModel>?,stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as FollowStatsModel?,isFollowing: null == isFollowing ? _self.isFollowing : isFollowing // ignore: cast_nullable_to_non_nullable
as bool,entitlement: null == entitlement ? _self.entitlement : entitlement // ignore: cast_nullable_to_non_nullable
as EntitlementUserModel,
  ));
}
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FollowStatsModelCopyWith<$Res>? get stats {
    if (_self.stats == null) {
    return null;
  }

  return $FollowStatsModelCopyWith<$Res>(_self.stats!, (value) {
    return _then(_self.copyWith(stats: value));
  });
}/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EntitlementUserModelCopyWith<$Res> get entitlement {
  
  return $EntitlementUserModelCopyWith<$Res>(_self.entitlement, (value) {
    return _then(_self.copyWith(entitlement: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserModel value)  $default,){
final _that = this;
switch (_that) {
case _UserModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String username,  String email,  String displayName,  String description,  String profilePic,  String? birthday,  String phone,  String methodSignUp,  String role,  int? gender,  String fcmToken,  bool isActive,  List<String> scannedData,  String password,  String createdAt,  bool isPublic,  List<UserModel>? followers,  List<UserModel>? following,  FollowStatsModel? stats,  bool isFollowing,  EntitlementUserModel entitlement)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.userId,_that.username,_that.email,_that.displayName,_that.description,_that.profilePic,_that.birthday,_that.phone,_that.methodSignUp,_that.role,_that.gender,_that.fcmToken,_that.isActive,_that.scannedData,_that.password,_that.createdAt,_that.isPublic,_that.followers,_that.following,_that.stats,_that.isFollowing,_that.entitlement);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String username,  String email,  String displayName,  String description,  String profilePic,  String? birthday,  String phone,  String methodSignUp,  String role,  int? gender,  String fcmToken,  bool isActive,  List<String> scannedData,  String password,  String createdAt,  bool isPublic,  List<UserModel>? followers,  List<UserModel>? following,  FollowStatsModel? stats,  bool isFollowing,  EntitlementUserModel entitlement)  $default,) {final _that = this;
switch (_that) {
case _UserModel():
return $default(_that.userId,_that.username,_that.email,_that.displayName,_that.description,_that.profilePic,_that.birthday,_that.phone,_that.methodSignUp,_that.role,_that.gender,_that.fcmToken,_that.isActive,_that.scannedData,_that.password,_that.createdAt,_that.isPublic,_that.followers,_that.following,_that.stats,_that.isFollowing,_that.entitlement);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String username,  String email,  String displayName,  String description,  String profilePic,  String? birthday,  String phone,  String methodSignUp,  String role,  int? gender,  String fcmToken,  bool isActive,  List<String> scannedData,  String password,  String createdAt,  bool isPublic,  List<UserModel>? followers,  List<UserModel>? following,  FollowStatsModel? stats,  bool isFollowing,  EntitlementUserModel entitlement)?  $default,) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.userId,_that.username,_that.email,_that.displayName,_that.description,_that.profilePic,_that.birthday,_that.phone,_that.methodSignUp,_that.role,_that.gender,_that.fcmToken,_that.isActive,_that.scannedData,_that.password,_that.createdAt,_that.isPublic,_that.followers,_that.following,_that.stats,_that.isFollowing,_that.entitlement);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _UserModel implements UserModel {
  const _UserModel({this.userId = "", this.username = "", this.email = "", this.displayName = "", this.description = "", this.profilePic = "", this.birthday, this.phone = "", this.methodSignUp = "", this.role = "user", this.gender, this.fcmToken = "", this.isActive = false, final  List<String> scannedData = const [], this.password = "", this.createdAt = "", this.isPublic = false, final  List<UserModel>? followers, final  List<UserModel>? following, this.stats, this.isFollowing = false, this.entitlement = const EntitlementUserModel()}): _scannedData = scannedData,_followers = followers,_following = following;
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override@JsonKey() final  String userId;
@override@JsonKey() final  String username;
@override@JsonKey() final  String email;
@override@JsonKey() final  String displayName;
@override@JsonKey() final  String description;
@override@JsonKey() final  String profilePic;
@override final  String? birthday;
@override@JsonKey() final  String phone;
@override@JsonKey() final  String methodSignUp;
@override@JsonKey() final  String role;
@override final  int? gender;
@override@JsonKey() final  String fcmToken;
@override@JsonKey() final  bool isActive;
 final  List<String> _scannedData;
@override@JsonKey() List<String> get scannedData {
  if (_scannedData is EqualUnmodifiableListView) return _scannedData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scannedData);
}

@override@JsonKey() final  String password;
@override@JsonKey() final  String createdAt;
@override@JsonKey() final  bool isPublic;
 final  List<UserModel>? _followers;
@override List<UserModel>? get followers {
  final value = _followers;
  if (value == null) return null;
  if (_followers is EqualUnmodifiableListView) return _followers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<UserModel>? _following;
@override List<UserModel>? get following {
  final value = _following;
  if (value == null) return null;
  if (_following is EqualUnmodifiableListView) return _following;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  FollowStatsModel? stats;
@override@JsonKey() final  bool isFollowing;
// Use in context of another user
@override@JsonKey() final  EntitlementUserModel entitlement;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.description, description) || other.description == description)&&(identical(other.profilePic, profilePic) || other.profilePic == profilePic)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.methodSignUp, methodSignUp) || other.methodSignUp == methodSignUp)&&(identical(other.role, role) || other.role == role)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other._scannedData, _scannedData)&&(identical(other.password, password) || other.password == password)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&const DeepCollectionEquality().equals(other._followers, _followers)&&const DeepCollectionEquality().equals(other._following, _following)&&(identical(other.stats, stats) || other.stats == stats)&&(identical(other.isFollowing, isFollowing) || other.isFollowing == isFollowing)&&(identical(other.entitlement, entitlement) || other.entitlement == entitlement));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,userId,username,email,displayName,description,profilePic,birthday,phone,methodSignUp,role,gender,fcmToken,isActive,const DeepCollectionEquality().hash(_scannedData),password,createdAt,isPublic,const DeepCollectionEquality().hash(_followers),const DeepCollectionEquality().hash(_following),stats,isFollowing,entitlement]);

@override
String toString() {
  return 'UserModel(userId: $userId, username: $username, email: $email, displayName: $displayName, description: $description, profilePic: $profilePic, birthday: $birthday, phone: $phone, methodSignUp: $methodSignUp, role: $role, gender: $gender, fcmToken: $fcmToken, isActive: $isActive, scannedData: $scannedData, password: $password, createdAt: $createdAt, isPublic: $isPublic, followers: $followers, following: $following, stats: $stats, isFollowing: $isFollowing, entitlement: $entitlement)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
 String userId, String username, String email, String displayName, String description, String profilePic, String? birthday, String phone, String methodSignUp, String role, int? gender, String fcmToken, bool isActive, List<String> scannedData, String password, String createdAt, bool isPublic, List<UserModel>? followers, List<UserModel>? following, FollowStatsModel? stats, bool isFollowing, EntitlementUserModel entitlement
});


@override $FollowStatsModelCopyWith<$Res>? get stats;@override $EntitlementUserModelCopyWith<$Res> get entitlement;

}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? username = null,Object? email = null,Object? displayName = null,Object? description = null,Object? profilePic = null,Object? birthday = freezed,Object? phone = null,Object? methodSignUp = null,Object? role = null,Object? gender = freezed,Object? fcmToken = null,Object? isActive = null,Object? scannedData = null,Object? password = null,Object? createdAt = null,Object? isPublic = null,Object? followers = freezed,Object? following = freezed,Object? stats = freezed,Object? isFollowing = null,Object? entitlement = null,}) {
  return _then(_UserModel(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,profilePic: null == profilePic ? _self.profilePic : profilePic // ignore: cast_nullable_to_non_nullable
as String,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as String?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,methodSignUp: null == methodSignUp ? _self.methodSignUp : methodSignUp // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int?,fcmToken: null == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,scannedData: null == scannedData ? _self._scannedData : scannedData // ignore: cast_nullable_to_non_nullable
as List<String>,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,followers: freezed == followers ? _self._followers : followers // ignore: cast_nullable_to_non_nullable
as List<UserModel>?,following: freezed == following ? _self._following : following // ignore: cast_nullable_to_non_nullable
as List<UserModel>?,stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as FollowStatsModel?,isFollowing: null == isFollowing ? _self.isFollowing : isFollowing // ignore: cast_nullable_to_non_nullable
as bool,entitlement: null == entitlement ? _self.entitlement : entitlement // ignore: cast_nullable_to_non_nullable
as EntitlementUserModel,
  ));
}

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FollowStatsModelCopyWith<$Res>? get stats {
    if (_self.stats == null) {
    return null;
  }

  return $FollowStatsModelCopyWith<$Res>(_self.stats!, (value) {
    return _then(_self.copyWith(stats: value));
  });
}/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EntitlementUserModelCopyWith<$Res> get entitlement {
  
  return $EntitlementUserModelCopyWith<$Res>(_self.entitlement, (value) {
    return _then(_self.copyWith(entitlement: value));
  });
}
}


/// @nodoc
mixin _$MetaDataUser {

 String get accessToken; String get refreshToken;
/// Create a copy of MetaDataUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetaDataUserCopyWith<MetaDataUser> get copyWith => _$MetaDataUserCopyWithImpl<MetaDataUser>(this as MetaDataUser, _$identity);

  /// Serializes this MetaDataUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetaDataUser&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken);

@override
String toString() {
  return 'MetaDataUser(accessToken: $accessToken, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class $MetaDataUserCopyWith<$Res>  {
  factory $MetaDataUserCopyWith(MetaDataUser value, $Res Function(MetaDataUser) _then) = _$MetaDataUserCopyWithImpl;
@useResult
$Res call({
 String accessToken, String refreshToken
});




}
/// @nodoc
class _$MetaDataUserCopyWithImpl<$Res>
    implements $MetaDataUserCopyWith<$Res> {
  _$MetaDataUserCopyWithImpl(this._self, this._then);

  final MetaDataUser _self;
  final $Res Function(MetaDataUser) _then;

/// Create a copy of MetaDataUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? refreshToken = null,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MetaDataUser].
extension MetaDataUserPatterns on MetaDataUser {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetaDataUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetaDataUser() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetaDataUser value)  $default,){
final _that = this;
switch (_that) {
case _MetaDataUser():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetaDataUser value)?  $default,){
final _that = this;
switch (_that) {
case _MetaDataUser() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accessToken,  String refreshToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetaDataUser() when $default != null:
return $default(_that.accessToken,_that.refreshToken);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accessToken,  String refreshToken)  $default,) {final _that = this;
switch (_that) {
case _MetaDataUser():
return $default(_that.accessToken,_that.refreshToken);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accessToken,  String refreshToken)?  $default,) {final _that = this;
switch (_that) {
case _MetaDataUser() when $default != null:
return $default(_that.accessToken,_that.refreshToken);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _MetaDataUser implements MetaDataUser {
  const _MetaDataUser({this.accessToken = '', this.refreshToken = ''});
  factory _MetaDataUser.fromJson(Map<String, dynamic> json) => _$MetaDataUserFromJson(json);

@override@JsonKey() final  String accessToken;
@override@JsonKey() final  String refreshToken;

/// Create a copy of MetaDataUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetaDataUserCopyWith<_MetaDataUser> get copyWith => __$MetaDataUserCopyWithImpl<_MetaDataUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetaDataUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetaDataUser&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken);

@override
String toString() {
  return 'MetaDataUser(accessToken: $accessToken, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class _$MetaDataUserCopyWith<$Res> implements $MetaDataUserCopyWith<$Res> {
  factory _$MetaDataUserCopyWith(_MetaDataUser value, $Res Function(_MetaDataUser) _then) = __$MetaDataUserCopyWithImpl;
@override @useResult
$Res call({
 String accessToken, String refreshToken
});




}
/// @nodoc
class __$MetaDataUserCopyWithImpl<$Res>
    implements _$MetaDataUserCopyWith<$Res> {
  __$MetaDataUserCopyWithImpl(this._self, this._then);

  final _MetaDataUser _self;
  final $Res Function(_MetaDataUser) _then;

/// Create a copy of MetaDataUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? refreshToken = null,}) {
  return _then(_MetaDataUser(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$EntitlementUserModel {

 bool get premium; int get activeUntilMillis; bool get willRenew; String get productId; String get sourcePlatform; String get tier;
/// Create a copy of EntitlementUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EntitlementUserModelCopyWith<EntitlementUserModel> get copyWith => _$EntitlementUserModelCopyWithImpl<EntitlementUserModel>(this as EntitlementUserModel, _$identity);

  /// Serializes this EntitlementUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EntitlementUserModel&&(identical(other.premium, premium) || other.premium == premium)&&(identical(other.activeUntilMillis, activeUntilMillis) || other.activeUntilMillis == activeUntilMillis)&&(identical(other.willRenew, willRenew) || other.willRenew == willRenew)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.sourcePlatform, sourcePlatform) || other.sourcePlatform == sourcePlatform)&&(identical(other.tier, tier) || other.tier == tier));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,premium,activeUntilMillis,willRenew,productId,sourcePlatform,tier);

@override
String toString() {
  return 'EntitlementUserModel(premium: $premium, activeUntilMillis: $activeUntilMillis, willRenew: $willRenew, productId: $productId, sourcePlatform: $sourcePlatform, tier: $tier)';
}


}

/// @nodoc
abstract mixin class $EntitlementUserModelCopyWith<$Res>  {
  factory $EntitlementUserModelCopyWith(EntitlementUserModel value, $Res Function(EntitlementUserModel) _then) = _$EntitlementUserModelCopyWithImpl;
@useResult
$Res call({
 bool premium, int activeUntilMillis, bool willRenew, String productId, String sourcePlatform, String tier
});




}
/// @nodoc
class _$EntitlementUserModelCopyWithImpl<$Res>
    implements $EntitlementUserModelCopyWith<$Res> {
  _$EntitlementUserModelCopyWithImpl(this._self, this._then);

  final EntitlementUserModel _self;
  final $Res Function(EntitlementUserModel) _then;

/// Create a copy of EntitlementUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? premium = null,Object? activeUntilMillis = null,Object? willRenew = null,Object? productId = null,Object? sourcePlatform = null,Object? tier = null,}) {
  return _then(_self.copyWith(
premium: null == premium ? _self.premium : premium // ignore: cast_nullable_to_non_nullable
as bool,activeUntilMillis: null == activeUntilMillis ? _self.activeUntilMillis : activeUntilMillis // ignore: cast_nullable_to_non_nullable
as int,willRenew: null == willRenew ? _self.willRenew : willRenew // ignore: cast_nullable_to_non_nullable
as bool,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,sourcePlatform: null == sourcePlatform ? _self.sourcePlatform : sourcePlatform // ignore: cast_nullable_to_non_nullable
as String,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [EntitlementUserModel].
extension EntitlementUserModelPatterns on EntitlementUserModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EntitlementUserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EntitlementUserModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EntitlementUserModel value)  $default,){
final _that = this;
switch (_that) {
case _EntitlementUserModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EntitlementUserModel value)?  $default,){
final _that = this;
switch (_that) {
case _EntitlementUserModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool premium,  int activeUntilMillis,  bool willRenew,  String productId,  String sourcePlatform,  String tier)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EntitlementUserModel() when $default != null:
return $default(_that.premium,_that.activeUntilMillis,_that.willRenew,_that.productId,_that.sourcePlatform,_that.tier);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool premium,  int activeUntilMillis,  bool willRenew,  String productId,  String sourcePlatform,  String tier)  $default,) {final _that = this;
switch (_that) {
case _EntitlementUserModel():
return $default(_that.premium,_that.activeUntilMillis,_that.willRenew,_that.productId,_that.sourcePlatform,_that.tier);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool premium,  int activeUntilMillis,  bool willRenew,  String productId,  String sourcePlatform,  String tier)?  $default,) {final _that = this;
switch (_that) {
case _EntitlementUserModel() when $default != null:
return $default(_that.premium,_that.activeUntilMillis,_that.willRenew,_that.productId,_that.sourcePlatform,_that.tier);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _EntitlementUserModel implements EntitlementUserModel {
  const _EntitlementUserModel({this.premium = false, this.activeUntilMillis = 0, this.willRenew = false, this.productId = "", this.sourcePlatform = "", this.tier = ""});
  factory _EntitlementUserModel.fromJson(Map<String, dynamic> json) => _$EntitlementUserModelFromJson(json);

@override@JsonKey() final  bool premium;
@override@JsonKey() final  int activeUntilMillis;
@override@JsonKey() final  bool willRenew;
@override@JsonKey() final  String productId;
@override@JsonKey() final  String sourcePlatform;
@override@JsonKey() final  String tier;

/// Create a copy of EntitlementUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EntitlementUserModelCopyWith<_EntitlementUserModel> get copyWith => __$EntitlementUserModelCopyWithImpl<_EntitlementUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EntitlementUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EntitlementUserModel&&(identical(other.premium, premium) || other.premium == premium)&&(identical(other.activeUntilMillis, activeUntilMillis) || other.activeUntilMillis == activeUntilMillis)&&(identical(other.willRenew, willRenew) || other.willRenew == willRenew)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.sourcePlatform, sourcePlatform) || other.sourcePlatform == sourcePlatform)&&(identical(other.tier, tier) || other.tier == tier));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,premium,activeUntilMillis,willRenew,productId,sourcePlatform,tier);

@override
String toString() {
  return 'EntitlementUserModel(premium: $premium, activeUntilMillis: $activeUntilMillis, willRenew: $willRenew, productId: $productId, sourcePlatform: $sourcePlatform, tier: $tier)';
}


}

/// @nodoc
abstract mixin class _$EntitlementUserModelCopyWith<$Res> implements $EntitlementUserModelCopyWith<$Res> {
  factory _$EntitlementUserModelCopyWith(_EntitlementUserModel value, $Res Function(_EntitlementUserModel) _then) = __$EntitlementUserModelCopyWithImpl;
@override @useResult
$Res call({
 bool premium, int activeUntilMillis, bool willRenew, String productId, String sourcePlatform, String tier
});




}
/// @nodoc
class __$EntitlementUserModelCopyWithImpl<$Res>
    implements _$EntitlementUserModelCopyWith<$Res> {
  __$EntitlementUserModelCopyWithImpl(this._self, this._then);

  final _EntitlementUserModel _self;
  final $Res Function(_EntitlementUserModel) _then;

/// Create a copy of EntitlementUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? premium = null,Object? activeUntilMillis = null,Object? willRenew = null,Object? productId = null,Object? sourcePlatform = null,Object? tier = null,}) {
  return _then(_EntitlementUserModel(
premium: null == premium ? _self.premium : premium // ignore: cast_nullable_to_non_nullable
as bool,activeUntilMillis: null == activeUntilMillis ? _self.activeUntilMillis : activeUntilMillis // ignore: cast_nullable_to_non_nullable
as int,willRenew: null == willRenew ? _self.willRenew : willRenew // ignore: cast_nullable_to_non_nullable
as bool,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,sourcePlatform: null == sourcePlatform ? _self.sourcePlatform : sourcePlatform // ignore: cast_nullable_to_non_nullable
as String,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$FollowStatsModel {

 int get countFollowers; int get countFollowing;
/// Create a copy of FollowStatsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FollowStatsModelCopyWith<FollowStatsModel> get copyWith => _$FollowStatsModelCopyWithImpl<FollowStatsModel>(this as FollowStatsModel, _$identity);

  /// Serializes this FollowStatsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FollowStatsModel&&(identical(other.countFollowers, countFollowers) || other.countFollowers == countFollowers)&&(identical(other.countFollowing, countFollowing) || other.countFollowing == countFollowing));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,countFollowers,countFollowing);

@override
String toString() {
  return 'FollowStatsModel(countFollowers: $countFollowers, countFollowing: $countFollowing)';
}


}

/// @nodoc
abstract mixin class $FollowStatsModelCopyWith<$Res>  {
  factory $FollowStatsModelCopyWith(FollowStatsModel value, $Res Function(FollowStatsModel) _then) = _$FollowStatsModelCopyWithImpl;
@useResult
$Res call({
 int countFollowers, int countFollowing
});




}
/// @nodoc
class _$FollowStatsModelCopyWithImpl<$Res>
    implements $FollowStatsModelCopyWith<$Res> {
  _$FollowStatsModelCopyWithImpl(this._self, this._then);

  final FollowStatsModel _self;
  final $Res Function(FollowStatsModel) _then;

/// Create a copy of FollowStatsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? countFollowers = null,Object? countFollowing = null,}) {
  return _then(_self.copyWith(
countFollowers: null == countFollowers ? _self.countFollowers : countFollowers // ignore: cast_nullable_to_non_nullable
as int,countFollowing: null == countFollowing ? _self.countFollowing : countFollowing // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FollowStatsModel].
extension FollowStatsModelPatterns on FollowStatsModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FollowStatsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FollowStatsModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FollowStatsModel value)  $default,){
final _that = this;
switch (_that) {
case _FollowStatsModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FollowStatsModel value)?  $default,){
final _that = this;
switch (_that) {
case _FollowStatsModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int countFollowers,  int countFollowing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FollowStatsModel() when $default != null:
return $default(_that.countFollowers,_that.countFollowing);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int countFollowers,  int countFollowing)  $default,) {final _that = this;
switch (_that) {
case _FollowStatsModel():
return $default(_that.countFollowers,_that.countFollowing);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int countFollowers,  int countFollowing)?  $default,) {final _that = this;
switch (_that) {
case _FollowStatsModel() when $default != null:
return $default(_that.countFollowers,_that.countFollowing);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
class _FollowStatsModel implements FollowStatsModel {
  const _FollowStatsModel({this.countFollowers = 0, this.countFollowing = 0});
  factory _FollowStatsModel.fromJson(Map<String, dynamic> json) => _$FollowStatsModelFromJson(json);

@override@JsonKey() final  int countFollowers;
@override@JsonKey() final  int countFollowing;

/// Create a copy of FollowStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FollowStatsModelCopyWith<_FollowStatsModel> get copyWith => __$FollowStatsModelCopyWithImpl<_FollowStatsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FollowStatsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FollowStatsModel&&(identical(other.countFollowers, countFollowers) || other.countFollowers == countFollowers)&&(identical(other.countFollowing, countFollowing) || other.countFollowing == countFollowing));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,countFollowers,countFollowing);

@override
String toString() {
  return 'FollowStatsModel(countFollowers: $countFollowers, countFollowing: $countFollowing)';
}


}

/// @nodoc
abstract mixin class _$FollowStatsModelCopyWith<$Res> implements $FollowStatsModelCopyWith<$Res> {
  factory _$FollowStatsModelCopyWith(_FollowStatsModel value, $Res Function(_FollowStatsModel) _then) = __$FollowStatsModelCopyWithImpl;
@override @useResult
$Res call({
 int countFollowers, int countFollowing
});




}
/// @nodoc
class __$FollowStatsModelCopyWithImpl<$Res>
    implements _$FollowStatsModelCopyWith<$Res> {
  __$FollowStatsModelCopyWithImpl(this._self, this._then);

  final _FollowStatsModel _self;
  final $Res Function(_FollowStatsModel) _then;

/// Create a copy of FollowStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? countFollowers = null,Object? countFollowing = null,}) {
  return _then(_FollowStatsModel(
countFollowers: null == countFollowers ? _self.countFollowers : countFollowers // ignore: cast_nullable_to_non_nullable
as int,countFollowing: null == countFollowing ? _self.countFollowing : countFollowing // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
