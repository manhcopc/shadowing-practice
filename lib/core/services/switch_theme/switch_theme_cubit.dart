import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../data/local/shared_prefs/storage.dart';

part 'switch_theme_state.dart';
part 'switch_theme_cubit.freezed.dart';

/// Cubit quản lý chuyển đổi theme của ứng dụng
///
/// Cung cấp các phương thức:
/// - Toggle giữa light và dark mode
/// - Lưu trạng thái theme vào local storage
@singleton
class SwitchThemeCubit extends Cubit<SwitchThemeState> {
  /// Khởi tạo với trạng thái từ storage
  /// - 0: Dark mode
  /// - 1: Light mode
  SwitchThemeCubit()
    : super(
        Storage.themeMode == 0
            ? const SwitchThemeState(themeMode: ThemeMode.dark)
            : const SwitchThemeState(themeMode: ThemeMode.light),
      );

  /// Chuyển đổi giữa light và dark mode
  void toggleTheme() {
    if (state.themeMode == ThemeMode.light) {
      Storage.setThemeMode(0);
      emit(state.copyWith(themeMode: ThemeMode.dark));
    } else {
      Storage.setThemeMode(1);
      emit(state.copyWith(themeMode: ThemeMode.light));
    }
  }

  /// Set theme mode trực tiếp
  void setThemeMode(ThemeMode mode) {
    Storage.setThemeMode(mode == ThemeMode.light ? 1 : 0);
    emit(state.copyWith(themeMode: mode));
  }
}
