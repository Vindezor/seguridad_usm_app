import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double iconSize = 150;
    const double avatarSize = iconSize / 2;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuenta'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: const [
                  CircleAvatar(
                    child: Icon(
                      Icons.account_circle,
                      size: iconSize,
                    ),
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.blue,
                    radius: avatarSize,
                  ),
                  Text(
                    'Richard Velasco',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 20,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nombre de usuario:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    TextFormField(
                      //decoration: InputDecoration(labelText: 'Nombre'),
                      initialValue: 'asdsad',
                      readOnly: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20,),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 20,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Correo Electrónico:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    TextFormField(
                      //decoration: InputDecoration(labelText: 'Nombre'),
                      initialValue: 'sdasdasd@gmail.com',
                      readOnly: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20,),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 20,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Numero de teléfono:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      //decoration: InputDecoration(labelText: 'Nombre'),
                      inputFormatters: [
                        MaskedInputFormatter('(###) ###-####')
                      ],
                      initialValue: '04242715167',
                      readOnly: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Actualizar datos'),
              ),
            ],
          )
        ],
      ),
    );
  }
}