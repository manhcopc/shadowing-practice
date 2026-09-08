part of 'sign_in_cubit.dart';

@freezed
abstract class SignInState with _$SignInState {
  const factory SignInState.initial() = _Initial;
  const factory SignInState.loading() = _Loading;
  const factory SignInState.error({
    String? errorMessage,
  }) = _Error;
  const factory SignInState.success({
    UserModel? user,
  }) = _Success;
}
