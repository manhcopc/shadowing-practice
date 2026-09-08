import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/settings_cubit.dart';
import '../widgets/legal_section.dart';
import '../widgets/support_section.dart';
import '../widgets/system_section.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsCubit, SettingsState>(
      listener: (context, state) {},
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8.h),

                // System Section
                const SystemSection(),
                SizedBox(height: 32.h),

                // Support Section
                const SupportSection(),
                SizedBox(height: 32.h),

                // Legal Section
                const LegalSection(),
                SizedBox(height: 24.h),
              ],
            ),
          );
        },
      ),
    );
  }
}
