import 'package:flutter/material.dart';
import 'package:apptutoria/Screens/NuevaTutoria/components/body.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class NuevaTutoriaScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nueva tutoría"),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          new FlatButton(
              child: new Text('Cerrar sesión',
                  style: new TextStyle(fontSize: 17.0, color: Colors.white)),
              onPressed: loginController.signOut)
        ],
      ),
      body: Body(),
    );
  }
}
