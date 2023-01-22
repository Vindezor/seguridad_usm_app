import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Form(
      key: _formKey,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          const SizedBox(height: 10,),
          TextFormField(
            keyboardType: TextInputType.text,
            maxLength: 15,
            controller: controller.marcaController,
            decoration: const InputDecoration(
              icon: Icon(Icons.bus_alert),
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
          CupertinoButton(
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
        ],
      )
    );
  }
}