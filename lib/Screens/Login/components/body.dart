import 'package:flutter/material.dart';

import 'package:apptutoria/widgets/background.dart';
import 'package:apptutoria/widgets/rounded_button.dart';
import 'package:apptutoria/constants.dart';
import 'package:flutter_svg/svg.dart';

String username = "";

class Body extends StatelessWidget {
  Body({Key key}) : super(key: key);

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            margin: new EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Text(
                  "SOLICITUDES ACADÉMICAS \n       (VISTA PROFESOR)",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                SizedBox(height: size.height * 0.03),
                SvgPicture.asset(
                  "assets/icons/logo.svg",
                  height: size.height * 0.30,
                ),
                SizedBox(height: size.height * 0.10),
                SizedBox(height: size.height * 0.05),
                TextFormField(
                  controller: email,
                  cursorColor: kPrimaryColor,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: kPrimaryLightColor,
                        width: 3,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(29)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: kPrimaryColor,
                        width: 3,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(29)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 3,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(29)),
                    ),
                    labelText: 'Usuario o Contraseña',
                    hintText: 'Usuario o Contraseña',
                    prefixIcon: Icon(Icons.person, color: kPrimaryColor),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese el correo';
                    }
                    return null;
                  },
                ),
                SizedBox(height: size.height * 0.03),
                TextFormField(
                  controller: pass,
                  obscureText: true,
                  cursorColor: kPrimaryColor,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: kPrimaryLightColor,
                        width: 3,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(29)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: kPrimaryColor,
                        width: 3,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(29)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 3,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(29)),
                    ),
                    labelText: 'Contraseña',
                    hintText: "Contraseña",
                    prefixIcon: Icon(Icons.lock, color: kPrimaryColor),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa la contraseña';
                    }
                    return null;
                  },
                ),
                SizedBox(height: size.height * 0.03),
                RoundedButton(
                  text: "INICIAR SESIÓN",
                  press: () async {
                    if (_formKey.currentState.validate()) {
                      loginController.login(
                          email.text.trim(), pass.text.trim());
                    }
                  },
                ),
                SizedBox(height: size.height * 0.01),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
