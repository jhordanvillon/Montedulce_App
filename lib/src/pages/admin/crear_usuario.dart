import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:montedulce_integrador/src/api/authentication_api.dart';
import 'package:montedulce_integrador/src/pages/admin/widget/titulo_widget.dart';
import 'package:montedulce_integrador/src/widgets/input_widget.dart';

class CrearUsuarioPage extends StatefulWidget {
  @override
  _CrearUsuarioPageState createState() => _CrearUsuarioPageState();
}

class _CrearUsuarioPageState extends State<CrearUsuarioPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFFEFDE1),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  TituloWidget(titulo: 'Crear Usuario',),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: _Form()
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {

  final nombreControl = TextEditingController();
  final apellidoControl = TextEditingController();
  final emailControl = TextEditingController();
  final contrasenaControl = TextEditingController();
  final usuarioControl = TextEditingController();
  final rolControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children: [
            Input(hinText: 'Nombre',icon: Icons.cake_outlined,controller: nombreControl,),
            SizedBox(height: 15.0),
            Input(hinText: 'Apellido',icon: Icons.description_outlined,controller: apellidoControl,),
            SizedBox(height: 15.0),
            Input(hinText: 'Email',icon: Icons.request_quote_outlined,controller: emailControl,),
            SizedBox(height: 15.0),
            Input(hinText: 'Contrase??a',icon: Icons.inventory,controller: contrasenaControl,),
            SizedBox(height: 15.0),
            Input(hinText: 'Usuario',icon: Icons.inventory,controller: usuarioControl),
            SizedBox(height: 15.0),
            Input(hinText: 'Rol',icon: Icons.inventory,controller: rolControl),
            SizedBox(height: 50.0),
            Container(
              width: double.infinity,
              child: CupertinoButton(
                color: Color(0xffE8DB65),
                child: Text( 'Guardar', style: TextStyle(color: Color(0XFF480E0A),fontSize: 18.0,fontWeight: FontWeight.bold),),
                onPressed: () async {
                  if(nombreControl.text.isNotEmpty && apellidoControl.text.isNotEmpty && emailControl.text.isNotEmpty && contrasenaControl.text.isNotEmpty && usuarioControl.text.isNotEmpty && rolControl.text.isNotEmpty){
                    final user = await AuthenticationApi.instance.registrar(context: context, nombre: nombreControl.text, apellidos: apellidoControl.text, password: contrasenaControl.text, email: emailControl.text, username: usuarioControl.text, adminNameRole: rolControl.text);
                    if(user != null){
                      Toast_msg("Usuario registrado");
                      limpiarCampos();
                    }else{
                      Toast_msg("El usuario no se pudo registrar");
                    }
                  }else{
                    Toast_msg("Complete todos los campos");
                  }
                },
              ),
            )
          ],
        ),
    );
  }

  void limpiarCampos(){
    nombreControl.text = "";
    apellidoControl .text = "";
    emailControl .text = "";
    contrasenaControl .text = "";
    usuarioControl  .text = "";
    rolControl  .text = "";
  }

  Future<bool> Toast_msg(String msg){
    return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,   
      backgroundColor: Colors.grey,  
      textColor: Colors.white  
    );
  }
}