import 'package:apptutoria/Screens/ModificacionSolicitud/modificacionSolicitud_screen.dart';
import 'package:apptutoria/widgets/categorias.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:apptutoria/widgets/background.dart';
import 'package:apptutoria/widgets/solicitudes_item_widget.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  final String tipoTutoria;
  Body({
    Key key,
    this.tipoTutoria,
    // this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    final userUid = user.uid;
    String mostrarTipoTutoria = "";
    mostrarTipoTutoria = tipoTutoria;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Text("Elija alguna categoria: ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            SizedBox(
              height: 5,
            ),
            Categorias(),
            Text(
              "\n Solicitudes $tipoTutoria",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
            SizedBox(
              height: 5,
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("solicitudes")
                  .doc(userUid)
                  .collection(mostrarTipoTutoria) //items
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                List<DocumentSnapshot> docs = snapshot.data.docs;

                return ListView.builder(
                    key: key,
                    itemCount: docs.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> data = docs[index].data();
                      return buildItem(context, data, tipoTutoria);
                    });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem(context, data, tipoTutoria) => SolicitudesItemWidget(
        item: data,
        onClicked: () => itemView(context, data, tipoTutoria),
      );

  void itemView(context, dynamic, tipoTutoria) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15),
              height: 525,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Información de la tutoría",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    // width: 200,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Fecha: " + dynamic['fecha'],
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    // width: 200,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Nombre: " + dynamic['nombre'],
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    // width: 200,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Cedula: " + dynamic['cedula'],
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Materia: " + dynamic['asignatura'],
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Carrera: " + dynamic['carrera'],
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    // width: 200,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Tema: " + dynamic['tema'],
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    // width: 200,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Tipo: " + dynamic['tipotutoria'],
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    // width: 200,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Estado: " + dynamic['estado'],
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BloquearBoton(tipoTutoria, dynamic, context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  BloquearBoton(tipoTutoria, dynamic, context) {
    if (tipoTutoria == "enviadas") {
      return ButtonBar(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RaisedButton(
            child: Text('Modificar', style: TextStyle(fontSize: 20)),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ModificacionSolicitudScreen(dynamic)),
            ),
            color: Colors.lightBlue,
            elevation: 50.0,
          ),
        ],
      );
    } else {
      if (dynamic['estado'] == "Aceptada") {
        return ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(
              child: Text('Aceptar', style: TextStyle(fontSize: 20)),
              onPressed: null,
              color: Colors.lightGreen,
              elevation: 50.0,
            ),
            RaisedButton(
              child: Text('Rechazar', style: TextStyle(fontSize: 20)),
              onPressed: () {
                solicitudController.updateEstadoRechazada(
                  dynamic['id'],
                  "Rechazada",
                );
              },
              color: Colors.redAccent,
              elevation: 50.0,
            ),
            RaisedButton(
              child: Text('Cambio de hora', style: TextStyle(fontSize: 20)),
              onPressed: null,
              color: Colors.brown,
              elevation: 50.0,
            ),
          ],
        );
      } else if (dynamic['estado'] == "Rechazada") {
        return ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(
              child: Text('Aceptar', style: TextStyle(fontSize: 20)),
              onPressed: () {
                solicitudController.updateEstadoAceptado(
                  dynamic['id'],
                  "Aceptada",
                );
              },
              color: Colors.lightGreen,
              elevation: 50.0,
            ),
            RaisedButton(
              child: Text('Rechazar', style: TextStyle(fontSize: 20)),
              onPressed: null,
              color: Colors.redAccent,
              elevation: 50.0,
            ),
            RaisedButton(
              child: Text('Cambio de fecha', style: TextStyle(fontSize: 20)),
              onPressed: () => Get.snackbar("About update", "",
                  backgroundColor: Colors.green,
                  snackPosition: SnackPosition.TOP,
                  titleText: Text(
                    "Enviado para cambio de fecha",
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  )),
              color: Colors.brown,
              elevation: 50.0,
            ),
          ],
        );
      } else {
        return ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(
              child: Text('Aceptar', style: TextStyle(fontSize: 20)),
              onPressed: () {
                solicitudController.updateEstadoAceptado(
                  dynamic['id'],
                  "Aceptada",
                );
              },
              color: Colors.lightGreen,
              elevation: 50.0,
            ),
            RaisedButton(
              child: Text('Rechazar', style: TextStyle(fontSize: 20)),
              onPressed: () {
                solicitudController.updateEstadoRechazada(
                  dynamic['id'],
                  "Rechazada",
                );
              },
              color: Colors.redAccent,
              elevation: 50.0,
            ),
            RaisedButton(
              child: Text('Cambio de hora', style: TextStyle(fontSize: 20)),
              onPressed: () => Get.snackbar("About update", "",
                  backgroundColor: Colors.green,
                  snackPosition: SnackPosition.TOP,
                  titleText: Text(
                    "Enviado para cambio de hora",
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  )),
              color: Colors.brown,
              elevation: 50.0,
            ),
          ],
        );
      }
    }
  }
}
