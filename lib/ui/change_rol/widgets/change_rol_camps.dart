import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../change_rol_controller.dart';

class ChangeRolCamps extends StatefulWidget {
  const ChangeRolCamps({Key? key}) : super(key: key);

  @override
  State<ChangeRolCamps> createState() => _ChangeRolCampsState();
}

class _ChangeRolCampsState extends State<ChangeRolCamps> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ChangeRolController>(context);
    return Form(
      key: _formKey,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          const SizedBox(height: 10,),
          DropdownButtonFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.bus_alert),
              border: OutlineInputBorder(),
              label: Text(
                "Usuario",
                style: TextStyle(
                  fontSize: 20
                ),
              ),
            ),
            items: controller.usuarios!.map(
              (e) => DropdownMenuItem(
                child: Text(e.username),
                value: e.id,
              )
            ).toList(),
            validator: controller.validateUsuario,
            onChanged: (int? value) {
              _formKey.currentState!.validate();
              if(value != null){
                controller.usuarioValue = value;
              }
            },
          ),
          const SizedBox(height: 10,),
          DropdownButtonFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.bus_alert),
              border: OutlineInputBorder(),
              label: Text(
                "Tipo de usuario",
                style: TextStyle(
                  fontSize: 20
                ),
              ),
            ),
            items: controller.tipoUsuarios!.map(
              (e) => DropdownMenuItem(
                child: Text(e.tipoUsuario),
                value: e.id,
              )
            ).toList(),
            validator: controller.validateTipoUsuario,
            onChanged: (int? value) {
              _formKey.currentState!.validate();
              if(value != null){
                controller.tipoUsuariosValue = value;
              }
            },
          ),
          const SizedBox(height: 10,),
          CupertinoButton(
            disabledColor: Colors.grey,
            color: Colors.blue,
            child: const Text(
              "Registrar cambio",
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