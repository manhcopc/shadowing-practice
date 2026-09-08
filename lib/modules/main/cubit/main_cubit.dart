import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/mixin/cancelable_base_bloc.dart';

part 'main_state.dart';
part 'main_cubit.freezed.dart';

class MainCubit extends Cubit<MainState> with CancelableBaseBloc<MainState> {
  MainCubit() : super(MainState.initial());
}
