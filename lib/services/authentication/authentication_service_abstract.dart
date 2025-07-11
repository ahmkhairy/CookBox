import 'package:firebase_auth/firebase_auth.dart';
import '../../models/user.dart';

abstract class AuthenticationServiceAbstract {
  FirebaseAuth get _auth => FirebaseAuth.instance;
  SystemUser? _user;

  @override
  // AppUser.SystemUser? get user;

  //Register with email and password
  Future registerWithEmail(String email, String password);

//lOGIN WITH EMAIL AND PASSWORD
  Future signInWithEmail(String email, String password);

  //signing out
  Future signOut();

  Future reset(String email);

  // SystemUser? transformData(firebaseUserData);
}
