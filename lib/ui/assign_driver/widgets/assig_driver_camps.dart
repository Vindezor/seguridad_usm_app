import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
              "Asignar chofer",
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
            isExpanded: true,
            decoration: const InputDecoration(
              icon: Icon(Icons.directions_bus, color: Colors.blue,),
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
                value: e.id,
                child: Text(e.nombre),
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
          const SizedBox(height: customHeight,),
          DropdownButtonFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person_search, color: Colors.blue,),
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
                value: e.id,
                child: Text(e.username),
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
          const SizedBox(height: customHeight,),
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
                "Asignar chofer",
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