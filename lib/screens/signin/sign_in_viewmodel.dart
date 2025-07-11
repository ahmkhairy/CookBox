import 'package:firebase_auth/firebase_auth.dart';
import 'package:map_mvvm/viewmodel.dart';
import 'package:karsome/app/service_locator.dart';
import 'package:karsome/services/user/user_service.dart';
import '../../models/user.dart';
import '../../services/authentication/authentication_service.dart';

class SignInViewModel extends Viewmodel {
  final AuthenticationService _service = AuthenticationService();
  final UserService _userService = UserService();
  SystemUser? client = SystemUser();
  // late SystemUser user;
  Future<String> signIn(String email, String password) async {
    try {
      var result = await _service.signInWithEmail(email, password);

      // If successful, set the client and return success
      client = _service.user;
      print("success!");
      return "Success";
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase Auth errors
      print("FirebaseAuthException: ${e.code} - ${e.message}");

      switch (e.code) {
        case 'user-not-found':
          return "No user found with this email.";
        case 'wrong-password':
          return "Incorrect password.";
        case 'invalid-email':
          return "Invalid email address.";
        case 'user-disabled':
          return "This user account has been disabled.";
        default:
          return "Authentication failed: ${e.message}";
      }
    } catch (e) {
      // Any other unexpected error
      print("Unexpected sign-in error: $e");
      return "Something went wrong. Please try again.";
    }
  }

  Future<String> getUserType() async {
    SystemUser user = await _userService.getUserInfo();
    String type = user.getUserType();
    return type;
  }
}
