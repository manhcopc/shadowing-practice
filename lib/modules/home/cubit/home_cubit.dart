import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/mixin/cancelable_base_bloc.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> with CancelableBaseBloc<HomeState> {
  HomeCubit() : super(HomeState.initial());
}
