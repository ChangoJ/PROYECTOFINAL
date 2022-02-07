import 'package:apptutoria/Screens/Login/login_screen.dart';
import 'package:apptutoria/Screens/Principal/principal_screen.dart';
import 'package:apptutoria/widgets/navigationbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../constants.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection =
    _firestore.collection('solicitudes');

class SolicitudController extends GetxController {
  static SolicitudController instance = Get.find();
  static String userUid;

  Rx<User> firebaseUser;
  @override
  void onReady() {
    super.onReady();
    // auth is comning from the constants.dart file but it is basically FirebaseAuth.instance.
    // Since we have to use that many times I just made a constant file and declared there
    firebaseUser = Rx<User>(auth.currentUser);

    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User user) async {
    if (user == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAll(() => LoginScreen());
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
      userUid = user.uid;
    }
  }

  Future<void> addItem(
    String fecha,
    String nombre,
    String cedula,
    String asignatura,
    String carrera,
    String tema,
    String tipotutoria,
    String estado,
  ) async {
    String id;
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('enviadas').doc();

    id = documentReferencer.id;

    Map<String, dynamic> data = <String, dynamic>{
      "id": id,
      "fecha": fecha,
      "nombre": nombre,
      "cedula": cedula,
      "asignatura": asignatura,
      "carrera": carrera,
      "tema": tema,
      "tipotutoria": tipotutoria,
      "estado": estado,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => Get.snackbar("About Login", "",
            backgroundColor: Colors.green,
            snackPosition: SnackPosition.TOP,
            // ignore: prefer_const_constructors
            titleText: Text(
              "Solicitud enviada correctamente",
              style: TextStyle(color: Colors.black, fontSize: 24),
            )) /*print("Solicitud enviada correctamente")*/)
        .catchError((e) => print(e));

    Get.offAll(() => MyNavigationBar());
  }

  Future<void> updateItem(
    String docId,
    String fecha,
    String nombre,
    String cedula,
    String asignatura,
    String carrera,
    String tema,
    String tipotutoria,
    String estado,
  ) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('enviadas').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "fecha": fecha,
      "nombre": nombre,
      "cedula": cedula,
      "asignatura": asignatura,
      "carrera": carrera,
      "tema": tema,
      "tipotutoria": tipotutoria,
      "estado": estado,
    };
    await documentReferencer
        .update(data)
        .whenComplete(() => Get.snackbar("About Login", "",
            backgroundColor: Colors.green,
            snackPosition: SnackPosition.TOP,
            // ignore: prefer_const_constructors
            titleText: Text(
              "Actualizado correctamente",
              style: TextStyle(color: Colors.black, fontSize: 24),
            ) /*print("Solicitud enviada correctamente")*/))
        .catchError((e) => print(e));
    Get.offAll(() => MyNavigationBar());
  }

  Future<void> updateEstadoAceptado(
    String docId,
    String estado,
  ) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('recibidas').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "estado": estado,
    };
    await documentReferencer
        .update(data)
        .whenComplete(() => Get.snackbar("About Login", "",
            backgroundColor: Colors.green,
            snackPosition: SnackPosition.TOP,
            // ignore: prefer_const_constructors
            titleText: Text(
              "Solicitud Aceptada",
              style: TextStyle(color: Colors.black, fontSize: 24),
            ) /*print("Solicitud enviada correctamente")*/))
        .catchError((e) => print(e));
    Get.offAll(() => MyNavigationBar());
  }

  Future<void> updateEstadoRechazada(
    String docId,
    String estado,
  ) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('recibidas').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "estado": estado,
    };
    await documentReferencer
        .update(data)
        .whenComplete(() => Get.snackbar("About Login", "",
            backgroundColor: Colors.red,
            snackPosition: SnackPosition.TOP,
            // ignore: prefer_const_constructors
            titleText: Text(
              "Solicitud Rechazada",
              style: TextStyle(color: Colors.black, fontSize: 24),
            ) /*print("Solicitud enviada correctamente")*/))
        .catchError((e) => print(e));
    Get.offAll(() => MyNavigationBar());
  }

  /*delete(String userId, String docId) async {
    try {
      FirebaseFirestore.instance
          .collection('solicitudes')
          .doc(userId)
          .collection('items')
          .doc(docId)
          .delete()
          .whenComplete(() {
        Get.snackbar(
          "Procesando Solicitud",
          "",
          backgroundColor: Colors.grey[300],
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "La Solicitud se borro con éxito",
            style: TextStyle(color: Colors.black),
          ),
        );
        Get.to(() => MyNavigationBar());
      });
    } catch (e) {
      print(e);
    }
  }*/

  deleteItem(
    String docId,
  ) async {
    print(docId);
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('enviadas').doc(docId);
    print(documentReferencer);
    await documentReferencer
        .delete()
        .whenComplete(() => Get.snackbar("Eliminando", "",
            backgroundColor: Colors.green,
            snackPosition: SnackPosition.TOP,
            // ignore: prefer_const_constructors
            titleText: Text(
              "Eliminado correctamente",
              style: TextStyle(color: Colors.black, fontSize: 24),
            )) /*print("Solicitud enviada correctamente")*/)
        .catchError((e) => print(e));
    Get.offAll(() => MyNavigationBar());
    print(documentReferencer);
  }

  Future<void> getSolicitudes() async {
    List itemsList = [];

    CollectionReference ItemCollection =
        _mainCollection.doc(userUid).collection('recibidas');
    QuerySnapshot solicitudes = await ItemCollection.get();

    if (solicitudes.docs.length != 0) {
      for (var doc in solicitudes.docs) {
        itemsList.add(doc.data());

        print(itemsList);
      }
    }
  }

  /*static Stream<QuerySnapshot> readItems() {
    CollectionReference ItemCollection =
        _mainCollection.doc(userUid).collection('items');

    return ItemCollection.snapshots();
  }*/
}
