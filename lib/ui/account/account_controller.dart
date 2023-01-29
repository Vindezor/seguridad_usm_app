import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AccountController extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  String? username;
  String? email;
  String? phone;
  String? fullName;

  bool dataLoaded = false;

  void loadData() async {
    username = await _storage.read(key: 'username_usuario');
    email = await _storage.read(key: 'correo_usuario');
    fullName = await _storage.read(key: 'full_name_usuario');
    phone = await _storage.read(key: 'telefono_usuario');

    usernameController.text = username!;
    emailController.text = email!;
    phoneController.text = phone!;
    dataLoaded = true;
    notifyListeners();
  }
}