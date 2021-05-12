import 'package:flutter/material.dart';
import 'package:montedulce_integrador/src/pages/admin/admin_home.dart';
import 'package:montedulce_integrador/src/pages/admin/estadisticas.dart';
import 'package:montedulce_integrador/src/pages/login.dart';
import 'package:montedulce_integrador/src/pages/register.dart';

import 'package:montedulce_integrador/src/pages/user/checkout.dart';
import 'package:montedulce_integrador/src/pages/user/cart.dart';
import 'package:montedulce_integrador/src/pages/user/home.dart';
import 'package:montedulce_integrador/src/pages/user/perfil.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        primaryColor: Color(0XFF480E0A),
        accentColor: Color(0XFF480E0A),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Color(0XFF480E0A),
        )
      ),
      debugShowCheckedModeBanner: false,
      routes:{
        'login'   : (BuildContext context) => LoginPage(),
        'register': (BuildContext context) => RegisterPage(),
        'home'    : (BuildContext context) => HomePage(),
        'checkout': (BuildContext context) => CheckoutPage(),
        'cart'    : (BuildContext context) => CartPage(),
        'perfil'  : (BuildContext context) => PerfilPage(),
        'adminHome': (BuildContext context) => AdminHome(),
        'estadisticas':(BuildContext context) => EstadisticasPage()
      },
      initialRoute: 'adminHome',
    );
  }
}