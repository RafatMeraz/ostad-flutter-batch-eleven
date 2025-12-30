import 'package:crafty_bay/app/set_up_network_caller.dart';
import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/services/network_caller.dart';
import 'package:crafty_bay/features/category/data/models/category_model.dart';
import 'package:flutter/foundation.dart';

class CategoryListProvider extends ChangeNotifier {
  final int _pageSize = 30;

  int _currentPageNo = 0;

  int? _lastPageNo;

  bool _initialLoading = false;

  bool _loadingMoreData = false;

  final List<CategoryModel> _categoryList = [];

  String? _errorMessage;

  List<CategoryModel> get categoryList => _categoryList;

  bool get initialLoading => _initialLoading;

  bool get moreLoading => _loadingMoreData;

  String? get errorMessage => _errorMessage;

  Future<bool> fetchCategoryList() async {
    bool isSuccess = false;

    if (_currentPageNo == 0) {
      _categoryList.clear();
      _initialLoading = true;
    } else if (_currentPageNo < _lastPageNo!) {
      _loadingMoreData = true;
    } else {
      return false;
    }
    notifyListeners();

    _currentPageNo++;

    final NetworkResponse response = await getNetworkCaller().getRequest(
      url: Urls.categoryListUrl(_pageSize, _currentPageNo),
    );
    if (response.isSuccess) {
      _lastPageNo ??= response.responseData['data']['last_page'];
      List<CategoryModel> list = [];
      for (Map<String, dynamic> jsonData
          in response.responseData['data']['results']) {
        list.add(CategoryModel.fromJson(jsonData));
      }
      _categoryList.addAll(list);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    if (_initialLoading) {
      _initialLoading = false;
    } else {
      _loadingMoreData = false;
    }

    notifyListeners();

    return isSuccess;
  }

  Future<void> loadInitialCategoryList() async {
    _currentPageNo = 0;
    _lastPageNo = null;
    await fetchCategoryList();
  }
}
