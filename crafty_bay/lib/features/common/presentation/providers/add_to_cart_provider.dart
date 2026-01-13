import 'package:crafty_bay/core/services/network_caller.dart';
import 'package:flutter/foundation.dart';

import '../../../../app/set_up_network_caller.dart';
import '../../../../app/urls.dart';

class AddToCartProvider extends ChangeNotifier {
  bool _addToCartInProgress = false;

  bool get addToCartInProgress => _addToCartInProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> addToCart(String productId) async {
    bool isSuccess = false;

    _addToCartInProgress = true;
    notifyListeners();

    Map<String, dynamic> requestBody = {
      'product': productId,
      "quantity": 2
    };

    final NetworkResponse response = await getNetworkCaller().postRequest(
      url: Urls.addToCartUrl,
      body: requestBody,
    );

    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }

    _addToCartInProgress = false;
    notifyListeners();

    return isSuccess;
  }
}