import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/user.dart';

class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<SystemUser> getUserInfo() async {
    final instance = FirebaseFirestore.instance;
    String userid = _auth.currentUser!.uid;

    DocumentSnapshot snapshot =
        await instance.collection('users').doc(userid).get();

    var rawData = snapshot.data();

    if (rawData is Map<String, dynamic>) {
      return SystemUser.fromJson(rawData);
    } else {
      throw Exception("Invalid user data format for user: $userid");
    }
  }
}
