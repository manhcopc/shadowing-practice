import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../core/locators/locator.dart';
import '../../profile/models/user_model.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.unauthenticated()) {
    emit(const AuthState.unauthenticated());
  }

  Future<void> login(UserModel user) async {
    emit(AuthState.authenticated(user));
  }

  Future<void> logout() async {
    await authRepository.logout();
    emit(const AuthState.unauthenticated());
  }
}
