import 'package:map_mvvm/viewmodel.dart';
import 'package:karsome/app/service_locator.dart';
import '../../services/authentication/authentication_service.dart';

class MainPageViewModel extends Viewmodel {
  final AuthenticationService _service = AuthenticationService();

  // late SystemUser user;
  signOutUser() async {
    try {
      await _service.signOut();
      return "Signed Out";
    } catch (e) {
      rethrow;
    }
  }

  // checkUser() async {
  //   try {
  //     String? userStatus = await _service.user.toString();
  //     if (userStatus == null) {
  //       return null;
  //     } else {
  //       return "signed in with uid " + userStatus;
  //     }
  //   } catch (e) {
  //
  //   }
  // }

  // Future getCurrentUser() {
  //   return _service.fecthUser();
  // }
}
