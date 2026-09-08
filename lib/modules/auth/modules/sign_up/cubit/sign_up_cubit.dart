import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../common/mixin/cancelable_base_bloc.dart';
import '../../../../../core/locators/locator.dart';
import '../../../models/request/signup_request.dart';

part 'sign_up_state.dart';
part 'sign_up_cubit.freezed.dart';

@lazySingleton
class SignUpCubit extends Cubit<SignUpState>
    with CancelableBaseBloc<SignUpState> {
  SignUpCubit() : super(const SignUpState.initial());
  FutureOr<void> signUp(
    String email,
    String username,
    String password,
    String firstName,
    String lastName,
  ) async {
    emit(SignUpState.loading());
    final signupRequest = SignUpRequest(
      email: email,
      username: username,
      password: password,
      firstName: firstName,
      lastName: lastName,
    );
    final response = await authRepository.signup(request: signupRequest);

    response.fold(
      (success) {
        emit(SignUpState.success());
      },
      (failure) {
        emit(SignUpState.error(errorMessage: failure.displayMessage));
      },
    );
  }
}
