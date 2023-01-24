import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../register_modelo_controller.dart';

class RegisterModeloCamps extends StatefulWidget {
  const RegisterModeloCamps({Key? key}) : super(key: key);

  @override
  State<RegisterModeloCamps> createState() => _RegisterModeloCampsState();
}

class _RegisterModeloCampsState extends State<RegisterModeloCamps> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RegisterModeloController>(context);
    const double? customHeight = 30;

    return Form(
      key: _formKey,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          Center(
            child: Text(
              "Registro de modelo",
              style: GoogleFonts.lobster(
                textStyle: const TextStyle(
                  color: Colors.blue,
                  fontSize: 30
                ),
              )
            ),
          ),
          const SizedBox(height: customHeight,),
          DropdownButtonFormField(
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
            items: controller.marcas!.map(
              (e) => DropdownMenuItem(
                child: Text(e.marca),
                value: e.id,
              )
            ).toList(),
            validator: controller.validateMarca,
            onChanged: (int? value) {
              _formKey.currentState!.validate();
              if(value != null){
                controller.marcaValue = value;
              }
            },
          ),
          const SizedBox(height: customHeight,),
          TextFormField(
            keyboardType: TextInputType.text,
            maxLength: 20,
            controller: controller.modeloController,
            decoration: const InputDecoration(
              icon: Icon(Icons.bus_alert, color: Colors.blue,),
              border: OutlineInputBorder(),
              label: Text(
                "Modelo",
                style: TextStyle(
                  fontSize: 20
                ),
              ),
            ),
            validator: controller.validateModelo,
            onChanged: (_) => _formKey.currentState!.validate(),
          ),
          const SizedBox(height: 10,),
          Align(
            child: CupertinoButton(
              disabledColor: Colors.grey,
              color: Colors.blue,
              child: const Text(
                "Registrar",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onPressed: (controller.enableButton())
              ? () async {
                  await controller.register(context);
              }
              : null,
            ),
          ),
        ],
      )
    );
  }
}