import 'package:crafty_bay/core/services/network_caller.dart';

NetworkCaller getNetworkCaller() {
  NetworkCaller networkCaller = NetworkCaller(
      headers: {
        'Content-type': 'application/json',
        'token': 'token',
      },
      onUnauthorize: () {
        // Move to login screen
      },
  );

  return networkCaller;
}