import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:karsome/services/authentication/authentication_service_abstract.dart';
import '../../models/user.dart';

class AuthenticationService extends AuthenticationServiceAbstract {
  FirebaseAuth get _auth => FirebaseAuth.instance;
  FirebaseFirestore get _storage => FirebaseFirestore.instance;
  SystemUser? _user;

  @override
  SystemUser? get user {
    _user ??= transformData(_auth.currentUser);

    return _user;
  }

  //Register with email and password
  @override
  Future registerWithEmail(String email, String password) async {
    try {
      UserCredential credentials = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User? user = credentials.user;

      return user;
    } catch (e) {
      rethrow;
    }
  }

//lOGIN WITH EMAIL AND PASSWORD
  @override
  Future signInWithEmail(String email, String password) async {
    print("the stuff are heree $email and $password");
    try {
      UserCredential credentials = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      String userid = _auth.currentUser!.uid;
      Future<dynamic> cartid = await initializeCart(userid);

      // Debugging: Log types and content
      print("Credentials: $credentials");
      print("User ID: $userid");
      print("Cart ID: $cartid");

      return 'Success+$cartid';
    } catch (e) {
      print("Error signing in: $e");
      return null;
    }
  }

  Future initializeCart(String userid) async {
    DocumentReference docRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userid)
        .collection('Cart')
        .doc();
    return await docRef.set((docRef.id));
  }

  //signing out
  @override
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }

  @override
  Future reset(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      rethrow;
    }
  }

  SystemUser? transformData(firebaseUserData) {
    if (firebaseUserData == null) return null;
    String uid = firebaseUserData.uid;
    return null;

    // return SystemUser(
    //     fullName: firebaseUserData.displayName,
    //     email: firebaseUserData.email,
    //     phoneNumber: firebaseUserData.phoneNo,
    //     address: '',
    //     type: firebaseUserData.type,
    //     password: firebaseUserData.password,
    //     userid: firebaseUserData.uid);
  }
}
