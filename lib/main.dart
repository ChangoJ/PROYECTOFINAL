import 'package:apptutoria/Screens/Login/login_screen.dart';
import 'package:apptutoria/controllers/login_controller.dart';
import 'package:apptutoria/controllers/solicitud_controller.dart';
import 'package:flutter/material.dart';
import 'package:apptutoria/constants.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseInitialization.then((value) {
    Get.put(LoginController());
    Get.put(SolicitudController());
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  /*final key = GlobalKey<AnimatedListState>();*/
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Solicitudes Académicas',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: LoginScreen(),
    );
  }
}
