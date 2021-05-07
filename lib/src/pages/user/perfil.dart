import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:montedulce_integrador/src/widgets/input_widget.dart';

class PerfilPage extends StatefulWidget {
  PerfilPage({Key key}) : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  
  bool editar = false;
  String nombres , dni, correo, numero;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    
    return Scaffold(
       backgroundColor: Color(0xFFFEFDE1),
       body: Stack(
           children: <Widget>[
            _fondoPerfil(size),
            _perfilImagen(size),
            _datos(size),
           ],
         ),
    );
  }

  Widget _fondoPerfil(Size size) {
    return Container(
      width: double.infinity,
      height: size.height * 0.3,
      child:  Image(
        image: AssetImage('assets/peru_libre.jpg'),
        fit: BoxFit.cover,
      )
    );
  }

  Widget _perfilImagen(Size size) {
    return Container(
      margin: EdgeInsets.only(top: size.width * 0.3, left: size.width * 0.3),
      width: 130.0,
      height: 130.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/castillo.jpg'),
          fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.circular(80.0)
      ),
    );
  }

  Widget _datos(Size size) {
    return Container(
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.only(top: size.height * 0.4),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Input(icon: Icons.person_outline, fill: true, fillColor: Colors.white,hinText: 'Nombres',initialValue: 'Pedro Castillo',enabled: editar,),
            SizedBox(height: 15.0),
            Input(icon: Icons.fact_check_outlined, fill: true, fillColor: Colors.white,hinText: 'DNI',initialValue: '45527894',enabled: editar,),
            SizedBox(height: 15.0),
            Input(icon: Icons.email_outlined, fill: true, fillColor: Colors.white,hinText: 'Correo electronico',initialValue: 'marxismo@gmail.com',enabled: editar,),
            SizedBox(height: 15.0),
            Input(icon: Icons.phone_android_outlined, fill: true, fillColor: Colors.white,hinText: 'Numero de telefono',initialValue: '+51 999 666 999',enabled: editar,),
            SizedBox(height: 25.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                boton('Editar', (){setState(() => editar ? editar = false : editar = true );}),
                boton('Guardar', (){}),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget boton(String texto, Function press){
    return CupertinoButton(
        padding: EdgeInsets.symmetric(horizontal: 53.0),
        color: Color(0xFFE8DB65),
        child: Text( texto, style: TextStyle(color: Color(0XFF480E0A),fontSize: 18.0,fontWeight: FontWeight.bold),),
        onPressed: press,
    );
  }
}