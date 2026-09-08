import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/widgets/app_text.dart';
import '../cubit/home_cubit.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: Handle side effects like navigation, snackbars, etc.
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Center(
            child: AppText(
              'This is the Home Body',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
    );
  }
}
