import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  //funtn to upload picked img to firebase
  _uploadImageToStorage(Uint8List? image) async {
    Reference ref =
        _firebaseStorage.ref().child('profile').child(_auth.currentUser!.uid);

    UploadTask uploadTask = ref.putData(image!);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  //fuctn to pic img
  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      return _file.readAsBytes();
    } else {
      print('no image selected');
    }
  }

  Future<String> signUpUsers(
      String fullName, String email, String password, Uint8List? image) async {
    String res = 'some error occured';
    try {
      if (fullName.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        String downloadUrl = await _uploadImageToStorage(image);

        await _firestore.collection('users').doc(cred.user!.uid).set({
          'fullName': fullName,
          'email': email,
          'password': password,
          'image': downloadUrl,
        });
        res = 'success';
        print('account created');
      } else {
        res = 'Please fields must not be empty';
        print('account fiels must not be empty');
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> loginUsers(String email, String password) async {
    String res = 'some error occured';

    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
        print('Login success');
      } else {
        res = 'please fields must not be empty';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
