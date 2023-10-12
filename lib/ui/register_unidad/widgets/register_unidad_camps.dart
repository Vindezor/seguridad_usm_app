import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
              "Registro de unidad",
              style: GoogleFonts.lobster(
                textStyle: const TextStyle(
                  color: Colors.blue,
                  fontSize: 30
                ),
              )
            ),
          ),
          const SizedBox(height: 30,),
          TextFormField(
            maxLength: 30,
            controller: controller.nombreUnidadController,
            decoration: const InputDecoration(
              icon: Icon(Icons.edit_note, color: Colors.blue,),
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
                value: e.id,
                child: Text(e.marca),
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
          const SizedBox(height: customHeight,),
          DropdownButtonFormField(
            key: _keyModelo,
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
            items: controller.modelosAct!.map(
              (e) => DropdownMenuItem(
                value: e.id,
                child: Text(e.modelo),
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
          const SizedBox(height: customHeight,),
          TextFormField(
            readOnly: true,
            controller: controller.yearController,
            decoration: const InputDecoration(
              icon: Icon(Icons.calendar_month, color: Colors.blue,),
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
          const SizedBox(height: customHeight,),
          TextFormField(
            maxLength: 7,
            controller: controller.placaUnidadController,
            decoration: const InputDecoration(
              icon: Icon(Icons.badge, color: Colors.blue,),
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
  
  void resetModelo(){
    if(_keyModelo.currentState != null){
      _keyModelo.currentState!.reset();
    }
  }
}