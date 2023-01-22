import 'package:flutter/material.dart';
import 'package:login_app/routes/routes.dart';
import 'package:login_app/ui/account/account_page.dart';
import 'package:login_app/ui/admin_home/admin_home_page.dart';
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
    Routes.admin_home: (_) => const AdminHomePage(),
    Routes.register_marca: (_) => const RegisterMarcaPage(),
    Routes.register_modelo: (_) => const RegisterModeloPage(),
    Routes.register_unidad: (_) => const RegisterUnidadPage(),
  };
}