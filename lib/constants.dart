import 'package:apptutoria/controllers/login_controller.dart';
import 'package:apptutoria/controllers/solicitud_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF01579B);
const kPrimaryLightColor = Color(0XFFE1F5FE);
const String SignOut = 'Cerrar sesión';

LoginController loginController = LoginController.instance;
SolicitudController solicitudController = SolicitudController.instance;
final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp();
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
