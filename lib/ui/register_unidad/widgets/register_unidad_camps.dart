import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_app/utils/uppercase_formatter.dart';
import 'package:provider/provider.dart';

import '../register_unidad_controller.dart';

class RegisterUnidadCamps extends StatefulWidget {
  const RegisterUnidadCamps({Key? key}) : super(key: key);

  @override
  State<RegisterUnidadCamps> createState() => _RegisterUnidadCampsState();
}

class _RegisterUnidadCampsState extends State<RegisterUnidadCamps> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> _keyModelo = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RegisterUnidadController>(context);
    return Form(
      key: _formKey,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          const SizedBox(height: 10,),
          TextFormField(
            maxLength: 30,
            controller: controller.nombreUnidadController,
            decoration: const InputDecoration(
              icon: Icon(Icons.directions_bus),
              border: OutlineInputBorder(),
              label: Text(
                "Nombre de la Unidad",
                style: TextStyle(
                  fontSize: 20
                ),
              ),
            ),
            validator: controller.validateNombreUnidad,
            onChanged: (_) => _formKey.currentState!.validate(),
          ),
          const SizedBox(height: 10,),
          DropdownButtonFormField(
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
            items: controller.marcas!.map(
              (e) => DropdownMenuItem(
                child: Text(e.marca),
                value: e.id,
              )
            ).toList(),
            validator: controller.validateMarca,
            onChanged: (int? value) {
              if(value != null){
                controller.changeModelo(value);
                controller.marcaValue = value;
                resetModelo();
              }
              _formKey.currentState!.validate();
            },
          ),
          const SizedBox(height: 10,),
          DropdownButtonFormField(
            key: _keyModelo,
            decoration: const InputDecoration(
              icon: Icon(Icons.bus_alert),
              border: OutlineInputBorder(),
              label: Text(
                "Modelo",
                style: TextStyle(
                  fontSize: 20
                ),
              ),
            ),
            items: controller.modelosAct!.map(
              (e) => DropdownMenuItem(
                child: Text(e.modelo),
                value: e.id,
              )
            ).toList(),
            validator: controller.validateModelo,
            onChanged: (int? value) {
              _formKey.currentState!.validate();
              if(value != null){
                controller.modeloValue = value;
              }
            },
          ),
          const SizedBox(height: 10,),
          TextFormField(
            readOnly: true,
            controller: controller.yearController,
            decoration: const InputDecoration(
              icon: Icon(Icons.directions_bus),
              border: OutlineInputBorder(),
              label: Text(
                "Año",
                style: TextStyle(
                  fontSize: 20
                ),
              ),
            ),
            validator: controller.validateYear,
            onChanged: (_) => _formKey.currentState!.validate(),
            onTap: () async {
              // DateTime? pickedDate = await showDatePicker(
              //   initialDatePickerMode: DatePickerMode.year,
              //   initialEntryMode: DatePickerEntryMode.input,
              //   context: context,
              //   initialDate: DateTime.now(),
              //   firstDate: DateTime(2000),
              //   lastDate: DateTime(2101)
              // );

              // if(pickedDate != null){
              //   print(pickedDate);
              // } else {
              //   print('not selected');
              // }
              controller.handleReadOnlyInputClick(context, _formKey);
            },
          ),
          const SizedBox(height: 10,),
          TextFormField(
            maxLength: 7,
            controller: controller.placaUnidadController,
            decoration: const InputDecoration(
              icon: Icon(Icons.directions_bus),
              border: OutlineInputBorder(),
              label: Text(
                "Placa de la Unidad",
                style: TextStyle(
                  fontSize: 20
                ),
              ),
            ),
            validator: controller.validatePlacaUnidad,
            onChanged: (_) => _formKey.currentState!.validate(),
            inputFormatters: [
              UpperCaseTextFormatter(),
            ],
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
  
  void resetModelo(){
    if(_keyModelo.currentState != null){
      _keyModelo.currentState!.reset();
    }
  }
}