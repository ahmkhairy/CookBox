import 'package:map_mvvm/viewmodel.dart';
import 'package:karsome/app/service_locator.dart';
import 'package:karsome/services/authentication/authentication_service.dart';
import 'package:karsome/services/authentication/authentication_service_abstract.dart';
import '../../models/user.dart';
import '../../services/storage/storage_service.dart';

class RegisterViewModel extends Viewmodel {
  final AuthenticationService _service = AuthenticationService();
  final StorageService _storage = StorageService();

  String getUserId(service) {
    return service.uid;
  }

  String userid = "";

  createUser(String name, String email, String password, String phoneNo) async {
    try {
      await _service.registerWithEmail(email, password);
      // userid = await _service.user.toString();
      //
      SystemUser user =
          SystemUser.regular(name, email, password, phoneNo, userid);
      await _storage.createRecord(user);
    } catch (e) {
      rethrow;
//figure error type
//if not human friendly we will go for line 21
      // if(e.message.includes("eam")){
      //   throw Exception("User Already Exists");
      // }else{
      //   throw Exception("Oops! Something Unexcpected Occurred")
      // }
      ///process the error, check the error message:
      // here we might receive the message : "user already exists!", this will be thrown to the widget for a popup dialog
    }
  }
}
