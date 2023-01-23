import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/ui/assign_driver/assign_driver_controller.dart';
import 'package:provider/provider.dart';

class AssignDriverCamps extends StatefulWidget {
  const AssignDriverCamps({Key? key}) : super(key: key);

  @override
  State<AssignDriverCamps> createState() => _AssignDriverCampsState();
}

class _AssignDriverCampsState extends State<AssignDriverCamps> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AssignDriverController>(context);
    return Form(
      key: _formKey,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          const SizedBox(height: 10,),
          DropdownButtonFormField(
            isExpanded: true,
            decoration: const InputDecoration(
              icon: Icon(Icons.bus_alert),
              border: OutlineInputBorder(),
              label: Text(
                "Unidad",
                style: TextStyle(
                  fontSize: 20
                ),
              ),
            ),
            items: controller.unidades!.map(
              (e) => DropdownMenuItem(
                child: Text(e.nombre),
                value: e.id,
              )
            ).toList(),
            validator: controller.validateUnidad,
            onChanged: (int? value) {
              _formKey.currentState!.validate();
              if(value != null){
                controller.unidadesValue = value;
              }
            },
          ),
          const SizedBox(height: 10,),
          DropdownButtonFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.bus_alert),
              border: OutlineInputBorder(),
              label: Text(
                "Conductor",
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
          CupertinoButton(
            disabledColor: Colors.grey,
            color: Colors.blue,
            child: const Text(
              "Asignar chofer",
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