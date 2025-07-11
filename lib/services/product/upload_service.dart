import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class UploadService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  UploadTask uploadFileToStorage(String destination, File file) {
    final ref = _storage.ref(destination);

    return ref.putFile(file);
  }
}
