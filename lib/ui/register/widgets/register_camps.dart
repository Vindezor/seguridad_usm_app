
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../register_controller.dart';

class RegisterCamps extends StatefulWidget {
  const RegisterCamps({ Key? key }) : super(key: key);

  @override
  State<RegisterCamps> createState() => _RegisterCampsState();
}

class _RegisterCampsState extends State<RegisterCamps> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TapGestureRecognizer tapGesture = TapGestureRecognizer();
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RegisterController>(context);
    return Form(
      key: _formKey,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          Center(
            child: Text(
              "Seguridad USM",
              style: GoogleFonts.lobster(
                textStyle: const TextStyle(
                  color: Colors.blue,
                  fontSize: 50
                ),
              )
            ),
          ),
          Center(
            child: Text(
              "Registro de usuario",
              style: GoogleFonts.lobster(
                textStyle: const TextStyle(
                  color: Colors.blue,
                  fontSize: 20
                ),
              )
            ),
          ),
          const SizedBox(height: 10,),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            maxLength: 50,
            controller: controller.emailController,
            decoration: const InputDecoration(
              icon: Icon(Icons.email, color: Colors.blue,),
              border: OutlineInputBorder(),
              label: Text(
                "Correo electrónico",
                style: TextStyle(
                  fontSize: 20
                ),
              ),
            ),
            validator: controller.validateEmail,
            onChanged: (_) => _formKey.currentState!.validate(),
          ),
          const SizedBox(height: 10,),
          TextFormField(
            keyboardType: TextInputType.phone,
            maxLength: 14,
            controller: controller.phoneController,
            decoration: const InputDecoration(
              icon: Icon(Icons.phone, color: Colors.blue,),
              border: OutlineInputBorder(),
              label: Text(
                "Teléfono",
                style: TextStyle(
                  fontSize: 20
                ),
              ),
            ),
            validator: controller.validatePhone,
            onChanged: (_) => _formKey.currentState!.validate(),
            inputFormatters: [
              MaskedInputFormatter('(###) ###-####')
            ],
          ),
          const SizedBox(height: 10,),
          TextFormField(
            maxLength: 30,
            controller: controller.fullNameController,
            decoration: const InputDecoration(
              icon: Icon(Icons.person, color: Colors.blue,),
              border: OutlineInputBorder(),
              label: Text(
                "Nombre Completo",
                style: TextStyle(
                  fontSize: 20
                ),
              ),
            ),
            validator: controller.validateFullName,
            onChanged: (_) => _formKey.currentState!.validate(),
          ),
          const SizedBox(height: 10,),
          TextFormField(
            keyboardType: TextInputType.number,
            maxLength: 9,
            controller: controller.cedulaController,
            decoration: const InputDecoration(
              icon: Icon(Icons.credit_card, color: Colors.blue,),
              border: OutlineInputBorder(),
              label: Text(
                "Cedula",
                style: TextStyle(
                  fontSize: 20
                ),
              ),
            ),
            validator: controller.validateCedula,
            onChanged: (_) => _formKey.currentState!.validate(),
          ),
          const SizedBox(height: 10,),
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
          const SizedBox(height: 10,),
          DropdownButtonFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.people_alt, color: Colors.blue,),
              border: OutlineInputBorder(),
              label: Text(
                "Género",
                style: TextStyle(
                  fontSize: 20
                ),
              ),
            ),
            items: controller.generos!.map(
              (e) => DropdownMenuItem(
                value: e.id,
                child: Text(e.gender),
              )
            ).toList(),
            validator: controller.validateGender,
            onChanged: (int? value) {
              _formKey.currentState!.validate();
              if(value != null){
                controller.genderValue = value;
              }
            },
          ),
          const SizedBox(height: 30,),
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
                icon: const Icon(Icons.remove_red_eye)
              ),
            ),
            validator: controller.validatePassword,
            onChanged: (_) => _formKey.currentState!.validate(),
          ),
          const SizedBox(height: 10,),
          Align(
            child: CupertinoButton(
              disabledColor: Colors.grey,
              color: Colors.blue,
              onPressed: (controller.enableButton())
              ? () async {
                  await controller.register(context);
              }
              : null,
              child: const Text(
                "Registrarse",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Center(
            child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: "¿Ya tienes cuenta? ",
                    style: TextStyle(
                      color: Colors.black
                    )
                  ),
                  TextSpan(
                    text: "Inicia sesión aquí",
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline
                    ),
                    recognizer: tapGesture..onTap =() {
                      Navigator.of(context).pop();
                    }
                  )
                ]
              ),
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