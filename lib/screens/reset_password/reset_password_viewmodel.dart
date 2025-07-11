import 'package:map_mvvm/viewmodel.dart';
import 'package:karsome/app/service_locator.dart';
import '../../services/authentication/authentication_service.dart';

class ResetPassViewModel extends Viewmodel {
  final AuthenticationService _service = AuthenticationService();

  resetPassword(String email) async {
    try {
      await _service.reset(email);
    } catch (e) {}
  }
}
