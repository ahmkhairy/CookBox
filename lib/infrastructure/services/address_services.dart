import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:karsome/infrastructure/models/address_model.dart';

class AddressServices {
  Stream<AddAddressModel> fetchUserRecord(String userID) {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userID)
        .snapshots()
        .map((userData) => AddAddressModel.fromJson(userData.data()!));
  }

  Future updateUserDetailsWithoutImage(AddAddressModel addressModel) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      "address": addressModel.address,
      "area": addressModel.area,
      "buildingName": addressModel.buildingName,
      "floor": addressModel.floor,
      "apartment": addressModel.apartment,
      "additionalInfo": addressModel.additionalInfo,
    }, SetOptions(merge: true));
  }
}
