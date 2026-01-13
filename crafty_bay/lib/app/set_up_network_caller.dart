import 'package:crafty_bay/core/services/network_caller.dart';
import 'package:crafty_bay/features/auth/presentation/providers/auth_controller.dart';

NetworkCaller getNetworkCaller() {
  NetworkCaller networkCaller = NetworkCaller(
      headers: {
        'Content-type': 'application/json',
        'token': AuthController.accessToken ?? ''
      },
      onUnauthorize: () {
        // Move to login screen
      },
  );

  return networkCaller;
}