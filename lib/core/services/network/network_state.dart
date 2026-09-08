part of 'network_cubit.dart';

@immutable
abstract class NetworkState extends Equatable {
  const NetworkState();
  @override
  List<Object> get props => [];
}

class NetworkConnected extends NetworkState {}

class NetworkDisconnected extends NetworkState {}
