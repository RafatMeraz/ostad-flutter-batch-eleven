import 'package:crafty_bay/app/set_up_network_caller.dart';
import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/services/network_caller.dart';
import 'package:flutter/foundation.dart';

import '../../data/models/slider_model.dart';

class HomeSliderProvider extends ChangeNotifier {
  bool _getHomeSlidersInProgress = false;

  bool get getHomeSlidersInProgress => _getHomeSlidersInProgress;

  List<SliderModel> _homeSliders = [];

  List<SliderModel> get homeSliders => _homeSliders;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getHomeSliders() async {
    bool isSuccess = false;
    _getHomeSlidersInProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().getRequest(
      url: Urls.homeSlidersUrl,
    );

    if (response.isSuccess) {
      List<SliderModel> sliders = [];
      for (Map<String, dynamic> slider
          in response.responseData['data']['results']) {
        sliders.add(SliderModel.fromJson(slider));
      }
      _homeSliders = sliders;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _getHomeSlidersInProgress = false;
    notifyListeners();

    return isSuccess;
  }
}
