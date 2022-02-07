import 'package:apptutoria/Screens/Principal/components/body.dart';
import 'package:apptutoria/widgets/navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Body body = Body();

class Categorias extends StatelessWidget {
  List<String> categorias = ["Recibidas", "Enviadas"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        height: 30,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categorias.length,
          itemBuilder: (context, index) => buildCategorias(index),
        ),
      ),
    );
  }

  Widget buildCategorias(int index) {
    return GestureDetector(
      onTap: () {
        selectedIndex = index;
        if (selectedIndex == 0) {
          String tipoTutoria = "recibidas";

          Get.offAll(() => MyNavigationBar(
                tipoTutoria: tipoTutoria,
              ));
        } else if (selectedIndex == 1) {
          String tipoTutoria = "enviadas";
          Get.offAll(() => MyNavigationBar(
                tipoTutoria: tipoTutoria,
              ));
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categorias[index].toUpperCase(),
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  // backgroundColor: Colors.blueGrey,
                  background: Paint()
                    ..strokeWidth = 25.0
                    ..color = Colors.lightGreen
                    ..style = PaintingStyle.stroke
                    ..strokeJoin = StrokeJoin.round
                  //color: selectedIndex == index ? Colors.black : Colors.white,
                  ),
            ),
            Container(
              height: 2,
              width: 30,
              //color: selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
