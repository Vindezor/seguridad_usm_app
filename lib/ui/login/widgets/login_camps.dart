
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/routes/routes.dart';
import 'package:login_app/ui/login/login_controller.dart';
import 'package:provider/provider.dart';


class LoginCamps extends StatefulWidget {
  const LoginCamps({ Key? key }) : super(key: key);

  @override
  State<LoginCamps> createState() => _LoginCampsState();
}

class _LoginCampsState extends State<LoginCamps> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TapGestureRecognizer tapGesture = TapGestureRecognizer();
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LoginController>(context);
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Seguridad USM",
            style: GoogleFonts.lobster(
              textStyle: const TextStyle(
                color: Colors.blue,
                fontSize: 50
              ),
            )
          ),
          Text(
            "Inicio de sesión",
            style: GoogleFonts.lobster(
              textStyle: const TextStyle(
                color: Colors.blue,
                fontSize: 20
              ),
            )
          ),
          TextFormField(
            maxLength: 15,
            controller: controller.usernameController,
            decoration: const InputDecoration(
              icon: Icon(Icons.person, color: Colors.blue,),
              border: OutlineInputBorder(),
              label: Text(
                "Nombre de usuario",
                style: TextStyle(
                  fontSize: 20
                ),
              ),
            ),
            validator: controller.validateUsername,
            onChanged: (_) => _formKey.currentState!.validate(),
          ),
          TextFormField(
            obscureText: controller.hidePassword,
            maxLength: 18,
            controller: controller.passwordController,
            decoration: InputDecoration(
              icon: const Icon(Icons.password, color: Colors.blue,),
              border: const OutlineInputBorder(),
              label: const Text(
                "Contraseña",
                style: TextStyle(
                  fontSize: 20
                ),
              ),
              suffixIcon: IconButton(
                onPressed: controller.changeHidePassword,
                icon: const Icon(Icons.remove_red_eye, color: Colors.blue,)
              ),
            ),
            validator: controller.validatePassword,
            onChanged: (_) => _formKey.currentState!.validate(),
          ),
          CupertinoButton(
            disabledColor: Colors.grey,
            color: Colors.blue,
            onPressed: (controller.enableButton())
            ? () async {
                await controller.login(context);
            }
            : null,
            child: const Text(
              "Iniciar sesión",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: "¿No tienes cuenta? ",
                  style: TextStyle(
                    color: Colors.black
                  )
                ),
                TextSpan(
                  text: "Registrate aquí",
                  style: const TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline
                  ),
                  recognizer: tapGesture..onTap = () {
                    FocusScope.of(context).unfocus();
                    Navigator.of(context).pushNamed(Routes.register);
                  }
                )
              ]
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tapGesture.dispose();
  }
}