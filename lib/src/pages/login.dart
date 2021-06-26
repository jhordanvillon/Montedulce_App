import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:montedulce_integrador/src/api/authentication_api.dart';
import 'package:montedulce_integrador/src/pages/user/home.dart';

class LoginPage extends StatefulWidget {
  
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey();

  final emailCtrl = TextEditingController();

  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // responsive
    return Scaffold(
        //resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFFEFDE1),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: size.width,
              height: size.height,
              child: Column(
                children: [
                  Container( // logo
                    height:size.height*0.23,
                    width: size.width*0.4,
                    child: Image(
                      image: AssetImage('assets/montedulce_logo.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container( // formulario
                    decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(20)),
                    height: size.height * 0.7,
                    width: size.width * 0.9,
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            SizedBox(
                              height:size.height*0.04),
                            Text('Compra deliciosos pasteles', style: TextStyle(color:Color(0XFF480E0A),fontSize:20),),
                            Container(
                              height: size.height*0.20,
                              width: size.width*0.50,
                              child: Image(
                                image: AssetImage('assets/tasting.png'),
                                fit:BoxFit.fill
                              ),
                            ),                  
                            Container(

                              padding: EdgeInsets.symmetric(horizontal:size.width*0.1),
                              child: TextFormField(
                                validator: (String text){
                                  if(text.isNotEmpty && text.length > 2){
                                    print("se cumple");
                                    return null;
                                  }
                                  return "El campo no puede ser vacio";
                                },
                                style: TextStyle(color:Color(0XFF480E0A),fontSize:20),
                                decoration: InputDecoration(hintText:'Usuario' ) ,
                                controller: emailCtrl,
                              )
                            ),
                            
                            SizedBox(
                              height:size.height*0.02),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal:size.width*0.1),
                              child: TextFormField(
                                validator: (String text){
                                  if(text.isNotEmpty && text.length > 2){
                                    print("se cumple");
                                    return null;
                                  }
                                  return "El campo no puede ser vacio";
                                },
                                style: TextStyle(color:Color(0XFF480E0A),fontSize:20),
                                decoration: InputDecoration(hintText:'Contraseña'),
                                obscureText: true,
                                controller: passCtrl
                              )
                            ),
                            SizedBox(
                              height:size.height*0.06),
                            Container( //button
                              child: Center(
                                // ignore: deprecated_member_use
                                child: RaisedButton(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 55.0, vertical: 3.0),
                                    child: Text('Login', style: TextStyle(color:Color(0xFF480E0A), fontSize:20, fontWeight: FontWeight.bold)),
                                    ),
                                    color: Color(0xffFEFDE1),
                                    onPressed: () async{
                                      final isOk = _formKey.currentState.validate();
                                      print(isOk);
                                       if(isOk){
                                        final user = await AuthenticationApi.instance.login(context: context, email: emailCtrl.text, password: passCtrl.text);
                                        print(user);
                                        if(user != null){
                                          print( "El nombre ->" + user.nombreCompleto);
                                          if(user.adminNameRole == "Administrador"){
                                            Navigator.pushNamed(context, "adminHome");
                                          }else{
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(usuario: user,)));
                                          }    
                                        }   
                                      } 
                                    },
                                ),
                              ),
                            ),
                              SizedBox(height: size.height * 0.02),
                          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                            Text('No tienes cuenta?',
                                style:
                                    TextStyle(color: Color(0xFF480E0A), fontSize: 18)
                            ),
                            CupertinoButton(
                                child: Text('Regístrate',style: TextStyle(color: Color(0XFFE1232D), fontSize: 18)),
                                onPressed: () => Navigator.pushNamed(context, 'register')
                            )
                          ])  
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
