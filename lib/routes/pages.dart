import 'package:flutter/material.dart';
import 'package:login_app/routes/routes.dart';
import 'package:login_app/ui/account/account_page.dart';
import 'package:login_app/ui/admin_home/admin_home_page.dart';
import 'package:login_app/ui/assign_driver/assign_driver_page.dart';
import 'package:login_app/ui/change_rol/change_rol_page.dart';
import 'package:login_app/ui/home/home_page.dart';
import 'package:login_app/ui/login/login_page.dart';
import 'package:login_app/ui/register/register_page.dart';
import 'package:login_app/ui/register_modelo/register_modelo_page.dart';
import 'package:login_app/ui/register_unidad/register_unidad_page.dart';
import 'package:login_app/ui/splash/splash_page.dart';

import '../ui/register_marca/register_marca_page.dart';

Map<String, Widget Function(BuildContext context)> appRoutes() {
  return {
    Routes.login: (_) => const LoginPage(),
    Routes.home: (_) => const HomePage(),
    Routes.register: (_) => const RegisterPage(),
    Routes.splash: (_) => const SplashPage(),
    Routes.account: (_) => const AccountPage(),
    Routes.adminHome: (_) => const AdminHomePage(),
    Routes.registerMarca: (_) => const RegisterMarcaPage(),
    Routes.registerModelo: (_) => const RegisterModeloPage(),
    Routes.registerUnidad: (_) => const RegisterUnidadPage(),
    Routes.changeRol: (_) => const ChangeRolPage(),
    Routes.assignDriver: (_) => const AssignDriverPage(),
  };
}