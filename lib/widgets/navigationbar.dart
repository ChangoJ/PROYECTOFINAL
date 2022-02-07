import 'package:flutter/material.dart';
import 'package:apptutoria/Screens/Login/login_screen.dart';
import 'package:apptutoria/Screens/NuevaTutoria/nuevaTutoria_screen.dart';
import 'package:apptutoria/Screens/Principal/principal_screen.dart';

class MyNavigationBar extends StatefulWidget {
  String tipoTutoria;
  MyNavigationBar({
    Key key,
    this.tipoTutoria,
  }) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.tipoTutoria == null) {
      widget.tipoTutoria = "recibidas";
    }
    final screens = [
      PrincipalScreen(widget.tipoTutoria),
      NuevaTutoriaScreen(),
    ];
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        iconSize: 40,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        /*onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },*/
        elevation: 5,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Inicio'),
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_rounded),
              title: Text('Nueva tutoria'),
              backgroundColor: Colors.yellow),
        ],
      ),
    );
  }
}
