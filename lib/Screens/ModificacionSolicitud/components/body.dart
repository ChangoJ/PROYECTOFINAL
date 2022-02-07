import 'package:flutter/material.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  final Map item;
  /* final String docId;
  final String materia;
  final String tipotutoria;
  final String carrera;
  final String fecha;
  final String estado;
  final String nombre;
  final String cedula;
  final String tema;*/

  Body({
    Key key,
    @required this.item,
    /* this.materia,
    this.tipotutoria,
    this.carrera,
    this.fecha,
    this.estado,
    this.nombre,
    this.cedula,
    this.tema,
    this.id,*/
  }) : super(key: key);

  String dropdownvalue = 'Seleccionar';

  var items = [
    "Sistemas Operativos",
    "Aplicaciones Móviles",
    "Servicio Comunitario",
    "Verificación y Validación de Software",
    "Económia para software",
    "Modélos matemáticos y simulación",
  ];

  var items2 = [
    "Individual",
    "Grupal",
  ];

  var items3 = [
    "Software",
    "Enfermeria",
    "Turismo",
    "Contabilidad",
    "Derecho",
    "Gatronomia",
    "Nutricion",
  ];

  var items4 = [
    "Aceptada",
    "En proceso",
    "Rechazado",
  ];

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    String uid = item['id'];
    TextEditingController docId = TextEditingController(text: item['id']);
    TextEditingController materia =
        TextEditingController(text: item['asignatura']);
    TextEditingController tipotutoria =
        TextEditingController(text: item['tipotutoria']);
    TextEditingController carrera =
        TextEditingController(text: item['carrera']);
    TextEditingController fecha = TextEditingController(text: item['fecha']);
    TextEditingController nombre = TextEditingController(text: item['nombre']);
    TextEditingController cedula = TextEditingController(text: item['cedula']);
    TextEditingController tema = TextEditingController(text: item['tema']);
    TextEditingController estado = TextEditingController(text: item['estado']);
    final _formKey = GlobalKey<FormState>();
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.only(
          top: 15,
          bottom: 15,
          left: 10,
          right: 10,
        ),
        children: <Widget>[
          TextFormField(
            enabled: false,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'ID',
              labelStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              icon: Icon(Icons.align_vertical_center_sharp),
            ),
            controller: docId,
          ),
          TextFormField(
            // initialValue: item["fecha"],
            keyboardType: TextInputType.datetime,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Fecha y Hora',
              labelStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              icon: Icon(Icons.calendar_today),
            ),
            controller: fecha,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa la fecha';
              }
              return null;
            },
          ),
          TextFormField(
            //initialValue: item["nombre"],
            controller: nombre,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Nombres y Apellidos',
              labelStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              icon: Icon(Icons.perm_identity),
            ),
            // controller: solicitudController.nombreController.value,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  RegExp(r'[!@#<>?":_`~;[\]\\/|=+)(*&^%0-9-]')
                      .hasMatch(value)) {
                return 'Por favor ingresa el nombre';
              }
              return null;
            },
          ),
          TextFormField(
            // initialValue: item["cedula"],
            maxLength: 10,
            controller: cedula,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Numero de cedula',
              labelStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              icon: Icon(Icons.format_indent_increase),
            ),
            // controller: solicitudController.cedulaController.value,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  value.length != 10 ||
                  RegExp(r'[!@#<>?":_`~;[\]\\/|=+)(*&^%A-Za-z-]')
                      .hasMatch(value)) {
                return 'Por favor ingresa la cedula correctamente';
              }
              return null;
            },
          ),
          TextFormField(
            // initialValue: item["asignatura"],
            controller: materia,
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              hintText: 'Seleccionar materia',
              labelText: 'Materia',
              labelStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              icon: Icon(Icons.book_online_outlined),
              suffixIcon: PopupMenuButton<String>(
                icon: const Icon(Icons.arrow_drop_down),
                onSelected: (String value) {
                  materia.text = value;
                },
                itemBuilder: (BuildContext context) {
                  return items.map<PopupMenuItem<String>>((String value) {
                    return new PopupMenuItem(
                        child: new Text(value), value: value);
                  }).toList();
                },
              ),
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  RegExp(r'[!@#<>?":_`~;[\]\\/|=+)(*&^%0-9-]')
                      .hasMatch(value)) {
                return 'Por favor ingresa la materia';
              }
              return null;
            },
          ),
          TextFormField(
            // initialValue: item["carrera"],
            controller: carrera,
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Carrera',
              labelStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              icon: Icon(Icons.grade),
              suffixIcon: PopupMenuButton<String>(
                icon: const Icon(Icons.arrow_drop_down),
                onSelected: (String value3) {
                  carrera.text = value3;
                },
                itemBuilder: (BuildContext context) {
                  return items3.map<PopupMenuItem<String>>((String value3) {
                    return new PopupMenuItem(
                        child: new Text(value3), value: value3);
                  }).toList();
                },
              ),
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  RegExp(r'[!@#<>?":_`~;[\]\\/|=+)(*&^%0-9-]')
                      .hasMatch(value)) {
                return 'Por favor ingresa la carrera';
              }
              return null;
            },
          ),
          TextFormField(
            // initialValue: item["tema"],
            controller: tema,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Tema a tratar',
              labelStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              icon: Icon(Icons.text_fields),
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  RegExp(r'[!@#<>?":_`~;[\]\\/|=+)(*&^%0-9-]')
                      .hasMatch(value)) {
                return 'Por favor ingresa el tema';
              }
              return null;
            },
          ),
          TextFormField(
            // initialValue: item["tipotutoria"],
            controller: tipotutoria,
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              hintText: 'Seleccionar Tipo de Tutoria',
              labelText: 'Tipo de tutoria',
              labelStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              icon: Icon(Icons.people),
              suffixIcon: PopupMenuButton<String>(
                icon: const Icon(Icons.arrow_drop_down),
                onSelected: (String value2) {
                  tipotutoria.text = value2;
                },
                itemBuilder: (BuildContext context) {
                  return items2.map<PopupMenuItem<String>>((String value2) {
                    return new PopupMenuItem(
                        child: new Text(value2), value: value2);
                  }).toList();
                },
              ),
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  RegExp(r'[!@#<>?":_`~;[\]\\/|=+)(*&^%0-9-]')
                      .hasMatch(value)) {
                return 'Por favor ingresa la tutoria';
              }
              return null;
            },
          ),
          TextFormField(
            // initialValue: item["tipotutoria"],
            controller: estado,
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              hintText: 'Seleccionar el estado',
              labelText: 'Estado',
              labelStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              icon: Icon(Icons.circle),
              suffixIcon: PopupMenuButton<String>(
                icon: const Icon(Icons.arrow_drop_down),
                onSelected: (String value2) {
                  estado.text = value2;
                },
                itemBuilder: (BuildContext context) {
                  return items4.map<PopupMenuItem<String>>((String value2) {
                    return new PopupMenuItem(
                        child: new Text(value2), value: value2);
                  }).toList();
                },
              ),
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  RegExp(r'[!@#<>?":_`~;[\]\\/|=+)(*&^%0-9-]')
                      .hasMatch(value)) {
                return 'Por favor ingresa el estado';
              }
              return null;
            },
          ),
          ButtonBar(mainAxisSize: MainAxisSize.min, children: <Widget>[
            RaisedButton(
              child: Text('Modificar tutoria'),
              color: Colors.lightBlueAccent,
              textColor: Colors.white,
              elevation: 8,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  solicitudController.updateItem(
                      docId.text.trim(),
                      fecha.text.trim(),
                      nombre.text.trim(),
                      cedula.text.trim(),
                      materia.text.trim(),
                      carrera.text.trim(),
                      tema.text.trim(),
                      tipotutoria.text.trim(),
                      estado.text.trim());
                }
              },
            ),
            RaisedButton(
              child: Text('Eliminar'),
              color: Colors.red,
              textColor: Colors.white,
              elevation: 8,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  print(uid);
                  solicitudController.deleteItem(uid);
                }
              },
            ),
          ]),
        ],
      ),
    );
  }
}
