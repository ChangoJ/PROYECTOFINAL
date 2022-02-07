import 'package:apptutoria/Screens/Login/login_screen.dart';
import 'package:apptutoria/constants.dart';
import 'package:apptutoria/widgets/navigationbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController instance = Get.find();
  Rx<User> firebaseUser;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User>(auth.currentUser);

    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User user) async {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => MyNavigationBar());
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (firebaseAuthException) {
      Get.snackbar("About Login", "",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          // ignore: prefer_const_constructors
          titleText: Text(
            "Correo o contraseña incorrecta",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ));
      /*messageText: Text(firebaseAuthException.toString(),
              style: TextStyle(color: Colors.white, fontSize: 12)));*/
    }
  }

  void signOut() async {
    await auth.signOut();
  }
}
