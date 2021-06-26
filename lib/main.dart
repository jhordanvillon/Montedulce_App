import 'package:flutter/material.dart';
import 'package:montedulce_integrador/src/pages/admin/admin_home.dart';
import 'package:montedulce_integrador/src/pages/admin/crear_categoria.dart';

import 'package:montedulce_integrador/src/pages/admin/crear_producto.dart';

import 'package:montedulce_integrador/src/pages/admin/categorias.dart';
import 'package:montedulce_integrador/src/pages/admin/crear_usuario.dart';
import 'package:montedulce_integrador/src/pages/admin/editar_categoria.dart';
import 'package:montedulce_integrador/src/pages/admin/editar_producto.dart';

import 'package:montedulce_integrador/src/pages/admin/estadisticas.dart';
import 'package:montedulce_integrador/src/pages/admin/pedidos_admin.dart';
import 'package:montedulce_integrador/src/pages/admin/productos.dart';
import 'package:montedulce_integrador/src/pages/admin/usuarios.dart';
import 'package:montedulce_integrador/src/pages/login.dart';
import 'package:montedulce_integrador/src/pages/register.dart';

import 'package:montedulce_integrador/src/pages/user/checkout.dart';
import 'package:montedulce_integrador/src/pages/user/cart.dart';
import 'package:montedulce_integrador/src/pages/user/home.dart';
import 'package:montedulce_integrador/src/pages/user/mis_pedidos.dart';
import 'package:montedulce_integrador/src/pages/user/perfil.dart';
import 'package:montedulce_integrador/src/service/stripe_sevice.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    new StripeService()..init();

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
        'estadisticas':(BuildContext context) => EstadisticasPage(),
        'productos':(BuildContext context)=>ProductoPage(),
        'crearProducto': (BuildContext context) => CrearProductoPage(),
        'editarProducto': (BuildContext context) => EditarProductoPage(),
        'crearUsuario': (BuildContext context) => CrearUsuarioPage(),
        'crearCategoria': (BuildContext context) => CrearCategoriaPage(),
        'editarCategoria': (BuildContext context) => EditarCategoriaPage(),
        'usuarios':(BuildContext context)=>UsuariosPage(),
        'categorias':(BuildContext context)=>CategoriasPage(),
        'misPedidos': (BuildContext context) => MisPedidosPage(),
        'adminPedidos' : (BuildContext context) => AdminPedidosPage(),
      },
      initialRoute: 'login',
    );
  }
}