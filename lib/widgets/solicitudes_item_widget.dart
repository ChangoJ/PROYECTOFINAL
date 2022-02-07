import 'package:apptutoria/Model/solicitudes_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SolicitudesItemWidget extends StatelessWidget {
  final Map item;
  final Animation animation;
  final VoidCallback onClicked;
  double scale = 1.0;
  SolicitudesItemWidget({
    @required this.item,
    @required this.animation,
    @required this.onClicked,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AnimatedScale(
        scale: scale,
        duration: const Duration(seconds: 2),
        /*child: SingleChildScrollView(*/
        child: Container(
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.amber[100],
          ),
          child: DataTable(
            columns: [
              DataColumn(
                label: Text(
                  "Fecha",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  "Asignatura",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  "Estado",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(
                    Text(
                      item['fecha'],
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: onClicked,
                  ),
                  DataCell(
                    Text(
                      item['asignatura'],
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: onClicked,
                  ),
                  DataCell(
                    Text(
                      item['estado'],
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: onClicked,
                  ),
                ],
              ),
            ],
          ),
        ),
        /*  ),*/
      );
}
