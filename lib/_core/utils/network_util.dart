import 'package:connectivity/connectivity.dart';

abstract class INetworkInformation {
  Future<bool> isConnected();

  Future<ConnectivityResult> get connectivityResult;

  Stream<ConnectivityResult> get onConnectivityChanged;
}

class NetworkInformation implements INetworkInformation {
  final Connectivity connectivity;

  NetworkInformation({required this.connectivity});

  @override
  Future<bool> isConnected() async {
    final result = await connectivity.checkConnectivity();
    if (result != ConnectivityResult.none) {
      return true;
    }
    return false;
  }

  @override
  Future<ConnectivityResult> get connectivityResult async {
    return connectivity.checkConnectivity();
  }

  @override
  Stream<ConnectivityResult> get onConnectivityChanged =>
      connectivity.onConnectivityChanged;
}
