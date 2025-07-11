import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/user.dart';

class StorageService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _storage = FirebaseFirestore.instance;
  // final signup= const RegisterPage(title:"signup");
  //Auth change user stream
  // Stream<User?> get user {
  //
  //   return _auth.authStateChanges();
  // }

  Future createRecord(SystemUser user) async {
    String uid = _auth.currentUser!.uid;
    final userCollection = _storage.collection('users');
    final addedUser = {
      'fullname': user.fullName,
      'email': user.email,
      'password': user.password,
      'phoneNo': user.phoneNumber,
      'address': user.address,
      'area': user.area,
      'buildingName': user.buildingName,
      'floor': user.floor,
      'apartment': user.apartment,
      'additionalInfo': user.additionalInfo,
      'userid': uid,
      'type': user.type
    };
    await userCollection.doc(uid).set(addedUser);
  }
}
