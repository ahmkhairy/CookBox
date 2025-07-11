import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'enums.dart';

class AppState with ChangeNotifier {
  AppCurrentState _status = AppCurrentState.IsFree;

  void stateStatus(AppCurrentState status) {
    _status = status;
    notifyListeners();
  }

  getStateStatus() => _status;
}
