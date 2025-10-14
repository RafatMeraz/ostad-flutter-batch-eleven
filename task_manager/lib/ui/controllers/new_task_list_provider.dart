import 'package:flutter/foundation.dart';

import '../../data/models/task_model.dart';
import '../../data/services/api_caller.dart';
import '../../data/utils/urls.dart';

class NewTaskListProvider extends ChangeNotifier {
  bool _getNewTasksInProgress = false;

  String? _errorMessage;

  List<TaskModel> _newTaskList = [];

  bool get getNewTasksProgress => _getNewTasksInProgress;

  String? get errorMessage => _errorMessage;

  List<TaskModel> get newTaskList => _newTaskList;

  Future<bool> getNewTasks() async {
    bool isSuccess = false;

    _getNewTasksInProgress = true;
    notifyListeners();

    final ApiResponse response = await ApiCaller.getRequest(
      url: Urls.newTaskListUrl,
    );
    if (response.isSuccess) {
      List<TaskModel> list = [];
      for (Map<String, dynamic> jsonData in response.responseData['data']) {
        list.add(TaskModel.fromJson(jsonData));
      }
      _newTaskList = list;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _getNewTasksInProgress = false;
    notifyListeners();

    return isSuccess;
  }
}
