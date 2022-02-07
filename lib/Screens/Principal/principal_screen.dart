import 'package:flutter/material.dart';
import 'package:apptutoria/Screens/Principal/components/body.dart';
import 'package:apptutoria/widgets/navigationbar.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class PrincipalScreen extends GetView {
  final String tipoTutoria;

  PrincipalScreen(this.tipoTutoria);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Solicitudes"),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          new FlatButton(
              child: new Text('Cerrar sesión',
                  style: new TextStyle(fontSize: 17.0, color: Colors.white)),
              onPressed: loginController.signOut)
        ],
      ),
      body: Body(
        tipoTutoria: tipoTutoria,
      ),
    );
  }
}
