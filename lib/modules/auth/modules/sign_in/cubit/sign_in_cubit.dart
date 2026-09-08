import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../common/mixin/cancelable_base_bloc.dart';
import '../../../../../core/locators/locator.dart';
import '../../../../../core/utils/logger.dart';
import '../../../../profile/models/user_model.dart';
import '../../../models/request/login_request.dart';

part 'sign_in_state.dart';
part 'sign_in_cubit.freezed.dart';

class SignInCubit extends Cubit<SignInState>
    with CancelableBaseBloc<SignInState> {
  SignInCubit() : super(const SignInState.initial());

  FutureOr<void> signIn(String username, String password) async {
    emit(const SignInState.loading());

    final loginRequest = LoginRequest(email: username, password: password);

    // Gọi AuthService để thực hiện đăng nhập với đối tượng LoginRequest
    final response = await authRepository.login(request: loginRequest);

    // Xử lý kết quả của AuthService
    await response.fold(
      (success) async {
        await authRepository.saveToken(
          success.meta.accessToken,
          success.meta.refreshToken,
        );
        final userInfo = await userRepository.getProfile();

        await userInfo.fold(
          (userInfo) async {
            logger.i('User info fetched successfully after login');
            await authRepository.saveUserInfo(userInfo.userInfo);
            emit(SignInState.success(user: userInfo.userInfo));
          },
          (error) async {
            logger.e('Failed to get user info: $error');
            await authRepository.logout();
            emit(SignInState.error(errorMessage: error.displayMessage));
          },
        );
      },
      (failure) async {
        logger.e('Login error: ${failure.displayMessage}');

        emit(SignInState.error(errorMessage: failure.displayMessage));
      },
    );
  }
}
