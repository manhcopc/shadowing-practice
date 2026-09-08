part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  // Initial state before any action is taken
  const factory AuthState.unauthenticated() = _Unauthenticated;

  // State representing a successful login
  const factory AuthState.authenticated(UserModel user) = _Authenticated;
}
