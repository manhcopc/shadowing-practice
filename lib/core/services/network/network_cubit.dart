import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

part 'network_state.dart';

@singleton
class NetworkCubit extends Cubit<NetworkState> {
  final Connectivity _connectivity = Connectivity();

  bool isListenerActive = false; // Cờ kiểm soát trạng thái xử lý

  NetworkCubit() : super(NetworkConnected()) {
    _initializeConnectivity();

    _connectivity.onConnectivityChanged.listen((event) {
      if (event.contains(ConnectivityResult.none)) {
        emit(NetworkDisconnected());
      } else {
        emit(NetworkConnected());
      }
    });
  }

  /// Khởi tạo kết nối và phát hành trạng thái ban đầu
  Future<void> _initializeConnectivity() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.none)) {
      emit(NetworkDisconnected());
    } else {
      emit(NetworkConnected());
    }
  }

  /// Kích hoạt cờ khi bắt đầu xử lý
  void activateListener() {
    isListenerActive = true;
  }

  /// Tắt cờ sau khi hoàn tất xử lý
  void deactivateListener() {
    isListenerActive = false;
  }
}
