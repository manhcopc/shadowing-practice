import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../core/language/generated/l10n.dart';
import '../../../shared/widgets/dialog_error.dart';
import 'network_cubit.dart';

BlocListener<NetworkCubit, NetworkState> networkListenerBlocListener({
  required VoidCallback onConnected, // Hàm callback được truyền vào
}) {
  return BlocListener<NetworkCubit, NetworkState>(
    listener: (context, state) {
      if (state is NetworkDisconnected) {
        SmartDialog.show(
          builder: (_) {
            return DialogError(
              onNetworkPressed: () {
                Navigator.pop(context); // Đóng dialog
              },
              onErrorPressed: () {},
              title: S.of(context).titleNoInternet,
              content: S.of(context).messageNoInternet,
              titleButton: S.of(context).buttonOk,
            );
          },
        ).then((value) {});
      }

      if (state is NetworkConnected) {
        // Gọi hàm callback khi mạng được kết nối
        onConnected();

        SmartDialog.showToast(
          S.of(context).messageInternetRestored,
          displayType: SmartToastType.normal,
          maskColor: Colors.black.withValues(alpha: 0.5),
          debounce: true,
        );
      }
    },
  );
}
