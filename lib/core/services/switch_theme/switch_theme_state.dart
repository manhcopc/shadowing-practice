part of 'switch_theme_cubit.dart';

@freezed
abstract class SwitchThemeState with _$SwitchThemeState {
  const factory SwitchThemeState({required ThemeMode themeMode}) =
      _SwitchThemeState;
}
