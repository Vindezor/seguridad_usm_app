import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../register_marca_controller.dart';

class RegisterMarcaCamps extends StatefulWidget {
  const RegisterMarcaCamps({Key? key}) : super(key: key);

  @override
  State<RegisterMarcaCamps> createState() => _RegisterMarcaCampsState();
}

class _RegisterMarcaCampsState extends State<RegisterMarcaCamps> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RegisterMarcaController>(context);
    const double customHeight = 30;
    return Form(
      key: _formKey,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          Center(
            child: Text(
              "Registro de marca",
              style: GoogleFonts.lobster(
                textStyle: const TextStyle(
                  color: Colors.blue,
                  fontSize: 30
                ),
              )
            ),
          ),
          const SizedBox(height: customHeight,),
          TextFormField(
            keyboardType: TextInputType.text,
            maxLength: 15,
            controller: controller.marcaController,
            decoration: const InputDecoration(
              icon: Icon(Icons.bus_alert, color: Colors.blue,),
              border: OutlineInputBorder(),
              label: Text(
                "Marca",
                style: TextStyle(
                  fontSize: 20
                ),
              ),
            ),
            validator: controller.validateMarca,
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
                "Registrar",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}