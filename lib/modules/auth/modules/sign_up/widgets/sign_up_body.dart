import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

import '../../../../../common/constants/constants.dart';
import '../../../../../common/generated/assets.gen.dart';
import '../../../../../core/language/generated/l10n.dart';
import '../../../../../core/services/dialog/dialog_service.dart';
import '../../../../../shared/widgets/app_button_send_form.dart';
import '../../../../../shared/widgets/app_text.dart';
import '../../../../../shared/widgets/form_field_widget.dart';
import '../../../cubits/form_cubit.dart' as form;
import '../../../../../shared/widgets/password_widget.dart';
import '../cubit/sign_up_cubit.dart';

class SignUpBody extends StatefulWidget {
  final VoidCallback? onToggleMode;

  const SignUpBody({super.key, this.onToggleMode});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  late final TextEditingController emailController;
  late final TextEditingController fullNameController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    fullNameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    fullNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        // Lắng nghe các trạng thái để hiển thị thông báo
        state.whenOrNull(
          success: () {
            // Điều hướng trở lại sign in
            widget.onToggleMode?.call();
            DialogService.toast(S.of(context).signUpSuccess);
          },
          error: (message) {
            // Hiển thị thông báo lỗi
            DialogService.toast(message ?? '');
          },
        );
      },
      child: BlocBuilder<form.FormCubit, form.FormState>(
        builder: (context, stateForm) {
          return BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, stateAuth) {
              String? emailError;
              String? fullNameError;
              String? passwordError;
              bool isLoading = false;
              bool isSignUpEnabled = false;

              // Kiểm tra trạng thái lỗi và loading
              stateForm.whenOrNull(
                error:
                    (
                      usernameErrorState,
                      emailErrorState,
                      passwordErrorState,
                      _,
                      _,
                      firstNameErrorState,
                      lastNameErrorState,
                      _,
                    ) {
                      emailError = emailErrorState;
                      fullNameError =
                          firstNameErrorState; // Sử dụng firstNameError slot cho fullName
                      passwordError = passwordErrorState;
                    },
              );

              stateAuth.whenOrNull(
                loading: () => isLoading = true, // Bật trạng thái loading
              );

              //Kiểm tra điều kiện bật nút Sign Up
              isSignUpEnabled =
                  emailError == null &&
                  fullNameError == null &&
                  passwordError == null &&
                  emailController.text.isNotEmpty &&
                  passwordController.text.isNotEmpty &&
                  fullNameController.text.isNotEmpty;

              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  FocusScope.of(context).unfocus();

                  final isEmailEmpty = emailController.text.trim().isEmpty;
                  final isPasswordEmpty = passwordController.text
                      .trim()
                      .isEmpty;
                  final isFullNameEmpty = fullNameController.text
                      .trim()
                      .isEmpty;
                  final hasEmailError = emailError != null;
                  final hasPasswordError = passwordError != null;
                  final hasFullNameError = fullNameError != null;

                  if (isEmailEmpty && hasEmailError) {
                    context.read<form.FormCubit>().validateEmail('');
                  }
                  if (isPasswordEmpty && hasPasswordError) {
                    context.read<form.FormCubit>().validatePassword('');
                  }
                  if (isFullNameEmpty && hasFullNameError) {
                    context.read<form.FormCubit>().validateFirstName('');
                  }

                  if (isEmailEmpty &&
                      isPasswordEmpty &&
                      isFullNameEmpty &&
                      (hasEmailError || hasPasswordError || hasFullNameError)) {
                    context.read<form.FormCubit>().reset();
                  }
                },
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Flexible(
                          flex: 1,
                          fit: FlexFit.loose,
                          child: Center(
                            child: ClipOval(
                              child: Assets.images.logoApp.image(
                                fit: BoxFit.contain,
                                width: MediaQuery.of(context).size.width * 0.4,
                              ),
                            ),
                          ),
                        ),

                        Flexible(
                          flex: 3,
                          fit: FlexFit.tight,
                          child: Padding(
                            padding: EdgeInsets.only(top: 16.0.h),
                            child: KeyboardAvoider(
                              autoScroll: true,

                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Center(
                                    child: AppText(
                                      S
                                          .of(context)
                                          .signUpToApp(AppConstants.nameApp),
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      textColor: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(height: 8.0.h),
                                  Center(
                                    child: AppText(
                                      S.of(context).welcomeSignUpMessage,
                                      fontSize: 16,
                                      textColor: Colors.grey[700],
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                  SizedBox(height: 24.0.h),
                                  FormFieldWidget(
                                    controller: emailController,
                                    textError: emailError,
                                    label: S.of(context).email,
                                    onTextChanged: (value) {
                                      context
                                          .read<form.FormCubit>()
                                          .validateEmail(value);
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 16.0.h,
                                    ),
                                    child: FormFieldWidget(
                                      controller: fullNameController,
                                      textError: fullNameError,
                                      label: S.of(context).fullName,
                                      onTextChanged: (value) {
                                        context
                                            .read<form.FormCubit>()
                                            .validateFirstName(value);
                                      },
                                    ),
                                  ),
                                  PasswordTextField(
                                    controller: passwordController,
                                    errorText: passwordError,
                                    onChanged: (value) {
                                      context
                                          .read<form.FormCubit>()
                                          .validatePassword(value);
                                    },
                                  ),
                                  AppButtonSendForm(
                                    isEnableButton: isSignUpEnabled,
                                    isLoading: isLoading,

                                    buttonText: S.of(context).signUp,
                                    onPressed: () {
                                      FocusScope.of(context).unfocus();

                                      // Generate username from email (phần trước @)
                                      final username = emailController.text
                                          .split('@')
                                          .first;

                                      // Tách full name thành first name và last name
                                      final fullNameParts = fullNameController
                                          .text
                                          .trim()
                                          .split(' ');
                                      final firstName = fullNameParts.isNotEmpty
                                          ? fullNameParts.first
                                          : '';
                                      final lastName = fullNameParts.length > 1
                                          ? fullNameParts.skip(1).join(' ')
                                          : '';

                                      // Gửi sự kiện sign up
                                      context.read<SignUpCubit>().signUp(
                                        emailController.text,
                                        username,
                                        passwordController.text,
                                        firstName,
                                        lastName,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(
                              S.of(context).alreadyHaveAccount,
                              fontSize: 14,
                            ),
                            SizedBox(width: 8.w),
                            AppText(
                              S.of(context).signIn,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              textColor: Theme.of(context).colorScheme.primary,
                              ignorePointer: false,
                              onTap: () {
                                widget.onToggleMode?.call();
                                context.read<form.FormCubit>().reset();
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0.h),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
