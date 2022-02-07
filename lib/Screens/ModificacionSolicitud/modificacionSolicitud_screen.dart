import 'package:apptutoria/Screens/ModificacionSolicitud/components/body.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../constants.dart';

class ModificacionSolicitudScreen extends GetView {
  final Map item;

  ModificacionSolicitudScreen(this.item);
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modificación tutoría"),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          new FlatButton(
              child: new Text('Cerrar sesión',
                  style: new TextStyle(fontSize: 17.0, color: Colors.white)),
              onPressed: loginController.signOut)
        ],
      ),
      body: Body(
        item: item,
      ),
    );
  }
}
