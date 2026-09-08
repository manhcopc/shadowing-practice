import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

import '../../../../../common/constants/constants.dart';
import '../../../../../common/generated/assets.gen.dart';
import '../../../../../core/app/app_router.dart';
import '../../../../../core/locators/locator.dart';
import '../../../../../core/language/generated/l10n.dart';
import '../../../../../core/services/dialog/dialog_service.dart';
import '../../../../../shared/widgets/app_button_send_form.dart';
import '../../../../../shared/widgets/app_text.dart';
import '../../../../../shared/widgets/form_field_widget.dart';
import '../../../cubits/form_cubit.dart' as form;
import '../cubit/sign_in_cubit.dart';
import '../../../../../shared/widgets/password_widget.dart';

class SignInBody extends StatefulWidget {
  final VoidCallback? onToggleMode;

  const SignInBody({super.key, this.onToggleMode});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, stateSignIn) {
        // Lắng nghe các trạng thái để hiển thị thông báo
        stateSignIn.whenOrNull(
          error: (apiError) {
            if (apiError != null) {
              DialogService.toast(apiError);
            }
          },
          success: (user) {
            authCubit.login(user!);
            DialogService.toast(S.of(context).loginSuccess);
            context.router.push(const MainRoute());
          },
        );
      },
      child: BlocBuilder<form.FormCubit, form.FormState>(
        builder: (context, stateForm) {
          return BlocBuilder<SignInCubit, SignInState>(
            builder: (context, stateSignIn) {
              String? emailError;
              String? passwordError;
              bool isLoading = false;
              bool isLoginEnabled = false;

              // Kiểm tra trạng thái lỗi và loading
              stateForm.whenOrNull(
                error: (_, emailErrorState, passwordErrorState, _, _, _, _, _) {
                  emailError = emailErrorState;
                  passwordError = passwordErrorState;
                },
              );

              stateSignIn.whenOrNull(
                loading: () {
                  isLoading = true;
                },
              );

              // Kiểm tra điều kiện bật nút login
              isLoginEnabled =
                  emailError == null &&
                  passwordError == null &&
                  emailController.text.isNotEmpty &&
                  passwordController.text.isNotEmpty;

              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  FocusScope.of(context).unfocus();

                  // Logic mới: chỉ clear error cho field đang rỗng
                  final isEmailEmpty = emailController.text.trim().isEmpty;
                  final isPasswordEmpty = passwordController.text
                      .trim()
                      .isEmpty;
                  final hasEmailError = emailError != null;
                  final hasPasswordError = passwordError != null;

                  // Case 1: Email rỗng nhưng có error -> clear email error
                  if (isEmailEmpty && hasEmailError) {
                    context.read<form.FormCubit>().validateEmail('');
                  }

                  // Case 2: Password rỗng nhưng có error -> clear password error
                  if (isPasswordEmpty && hasPasswordError) {
                    context.read<form.FormCubit>().validatePassword('');
                  }

                  // Case 3: Cả 2 đều rỗng và có error -> clear tất cả
                  if (isEmailEmpty &&
                      isPasswordEmpty &&
                      (hasEmailError || hasPasswordError)) {
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

                        // Tiêu đề
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
                                          .loginToApp(AppConstants.nameApp),
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      textColor: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                      textAlign: TextAlign.center,
                                      height: 1.2,
                                    ),
                                  ),

                                  SizedBox(height: 8.0.h),

                                  // Mô tả
                                  Center(
                                    child: AppText(
                                      S.of(context).welcomeBackMessage,
                                      fontSize: 16,
                                      textColor: Colors.grey[700],
                                      textAlign: TextAlign.center,
                                      height: 1.2,
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

                                  SizedBox(
                                    height: 16.0.h,
                                  ), // Khoảng cách giữa các trường
                                  PasswordTextField(
                                    controller: passwordController,
                                    errorText: passwordError,
                                    onChanged: (value) {
                                      context
                                          .read<form.FormCubit>()
                                          .validatePassword(value);
                                    },
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: AppText(
                                      S.of(context).forgotPassword,
                                      fontSize: 14,
                                      textColor: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                  AppButtonSendForm(
                                    isEnableButton: isLoginEnabled,
                                    isLoading: isLoading,
                                    buttonText: S.of(context).login,
                                    onPressed: () {
                                      FocusScope.of(context).unfocus();
                                      context.read<SignInCubit>().signIn(
                                        emailController.text.trim(),
                                        passwordController.text.trim(),
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
                              S.of(context).dontHaveAccount,
                              fontSize: 14,
                            ),
                            SizedBox(width: 8.w),
                            AppText(
                              S.of(context).signUp,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              textColor: Theme.of(context).colorScheme.primary,
                              ignorePointer: false,
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                context.read<form.FormCubit>().reset();
                                widget.onToggleMode?.call();
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
