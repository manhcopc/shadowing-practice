part of 'form_cubit.dart';

@freezed
class FormState with _$FormState {
  const factory FormState.initial() = _Initial;
  const factory FormState.error({
    String? usernameError,
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,
    String? currentPasswordError,
    String? firstNameError,
    String? lastNameError,
    String? otherError,
  }) = _Error;
}
