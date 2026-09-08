import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/mixin/cancelable_base_bloc.dart';

part 'settings_state.dart';
part 'settings_cubit.freezed.dart';

class SettingsCubit extends Cubit<SettingsState> with CancelableBaseBloc<SettingsState> {
  SettingsCubit() : super(SettingsState.initial());
}
