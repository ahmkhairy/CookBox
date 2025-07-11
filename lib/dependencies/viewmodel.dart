import 'package:flutter/foundation.dart';

enum ViewmodelState {
  busy,
  free,
  error,
}

class Viewmodel with ChangeNotifier {
  ViewmodelState _state = ViewmodelState.free;
  Error? _error;

  bool _initialized = false;
  bool get initialized => _initialized;
  void markInitialized() => _initialized = true;

  bool get isBusy => _state == ViewmodelState.busy;
  bool get isFree => _state == ViewmodelState.free;
  bool get isError => _state == ViewmodelState.error;
  Error? get error => _error;

  void _setState(ViewmodelState value) {
    _state = value;
    notifyListeners();
  }

  void stateBusy() => _setState(ViewmodelState.busy);
  void stateFree() => _setState(ViewmodelState.free);
  void stateError() => _setState(ViewmodelState.error);

  Future<void> update(AsyncCallback? callback) async {
    stateBusy();
    if (callback != null) {
      try {
        await callback();
        stateFree();
      } on Error catch (e) {
        _error = e;
        stateError();
      }
    }
  }

  void init() => markInitialized();
}
