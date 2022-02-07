import 'package:cloud_firestore/cloud_firestore.dart';

class SolicitudesItem {
  String id;
  String fecha;
  String nombre;
  String cedula;
  String asignatura;
  String carrera;
  String tema;
  String tipotutoria;
  String estado;

  SolicitudesItem({
    this.id,
    this.fecha,
    this.nombre,
    this.cedula,
    this.asignatura,
    this.carrera,
    this.tema,
    this.tipotutoria,
    this.estado,
  });

  SolicitudesItem.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    fecha = data['fecha'];
    nombre = data['nombre'];
    cedula = data['cedula'];
    asignatura = data['asignatura'];
    carrera = data['carrera'];
    tema = data['tema'];
    tipotutoria = data['tipotutoria'];
    estado = data['estado'];
  }

  SolicitudesItem.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    fecha = documentSnapshot["fecha"];
    nombre = documentSnapshot["nombre"];
    cedula = documentSnapshot["cedula"];
    asignatura = documentSnapshot["asignatura"];
    carrera = documentSnapshot["carrera"];
    tema = documentSnapshot["tema"];
    tipotutoria = documentSnapshot["tipotutoria"];
    estado = documentSnapshot["estado"];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': fecha,
      'nombre': nombre,
      'cedula': cedula,
      'asignatura': asignatura,
      'carrera': carrera,
      'tipotutoria': tipotutoria,
      'estado': estado,
    };
  }
}
