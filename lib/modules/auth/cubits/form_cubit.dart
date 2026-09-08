import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/extensions/string_x.dart';
import '../../../common/mixin/cancelable_base_bloc.dart';

part 'form_cubit.freezed.dart';
part 'form_state.dart';

class FormCubit extends Cubit<FormState> with CancelableBaseBloc<FormState> {
  FormCubit() : super(const FormState.initial());

  /// Validate và update email error
  void validateEmail(String email) {
    final emailError = email.getErrorEmailMessage();

    if (state is _Error) {
      final currentError = state as _Error;
      emit(currentError.copyWith(emailError: emailError));
    } else {
      emit(FormState.error(emailError: emailError));
    }
  }

  /// Validate và update username error
  void validateUsername(String username) {
    final usernameError = username.getErrorUsernameMessage();

    if (state is _Error) {
      final currentError = state as _Error;
      emit(currentError.copyWith(usernameError: usernameError));
    } else {
      emit(FormState.error(usernameError: usernameError));
    }
  }

  /// Validate và update password error
  void validatePassword(String password) {
    final passwordError = password.getErrorPasswordMessage();

    if (state is _Error) {
      final currentError = state as _Error;
      emit(currentError.copyWith(passwordError: passwordError));
    } else {
      emit(FormState.error(passwordError: passwordError));
    }
  }

  /// Validate và update confirm password error
  void validateConfirmPassword(String password, String confirmPassword) {
    final confirmPasswordError = password != confirmPassword
        ? 'Password does not match'
        : null;

    if (state is _Error) {
      final currentError = state as _Error;
      emit(currentError.copyWith(confirmPasswordError: confirmPasswordError));
    } else {
      emit(FormState.error(confirmPasswordError: confirmPasswordError));
    }
  }

  /// Validate và update current password error
  void validateCurrentPassword(String password) {
    final currentPasswordError = password.getErrorPasswordMessage();

    if (state is _Error) {
      final currentError = state as _Error;
      emit(currentError.copyWith(currentPasswordError: currentPasswordError));
    } else {
      emit(FormState.error(currentPasswordError: currentPasswordError));
    }
  }

  /// Validate và update first name error
  void validateFirstName(String firstName) {
    final firstNameError = firstName.getErrorNameMessage();

    if (state is _Error) {
      final currentError = state as _Error;
      emit(currentError.copyWith(firstNameError: firstNameError));
    } else {
      emit(FormState.error(firstNameError: firstNameError));
    }
  }

  /// Validate và update last name error
  void validateLastName(String lastName) {
    final lastNameError = lastName.getErrorNameMessage();

    if (state is _Error) {
      final currentError = state as _Error;
      emit(currentError.copyWith(lastNameError: lastNameError));
    } else {
      emit(FormState.error(lastNameError: lastNameError));
    }
  }

  /// Reset state về initial
  void reset() {
    emit(const FormState.initial());
  }
}
