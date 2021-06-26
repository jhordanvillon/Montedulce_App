import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:montedulce_integrador/src/api/categoria_api.dart';
import 'package:montedulce_integrador/src/api/photo_api.dart';
import 'package:montedulce_integrador/src/api/productos_api.dart';
import 'package:montedulce_integrador/src/models/photo.dart';
import 'package:montedulce_integrador/src/pages/admin/widget/dropdown_widget.dart';
import 'package:montedulce_integrador/src/pages/admin/widget/titulo_widget.dart';
import 'package:montedulce_integrador/src/utils/extras.dart';
import 'package:montedulce_integrador/src/widgets/input_widget.dart';

class CrearProductoPage extends StatefulWidget {
  @override
  _CrearProductoPageState createState() => _CrearProductoPageState();
}

class _CrearProductoPageState extends State<CrearProductoPage> {
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
                  TituloWidget(titulo: 'Crear Producto',),
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

  PickedFile file;


  final nombreControl = TextEditingController();
  final descripcionControl = TextEditingController();
  final precioControl = TextEditingController();
  String valor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children: [
            Input(hinText: 'Nombre',icon: Icons.cake_outlined, controller: nombreControl,),
            SizedBox(height: 15.0),
            Input(hinText: 'Descripción',icon: Icons.description_outlined,controller: descripcionControl),
            SizedBox(height: 15.0),
            Input(hinText: 'Precio',icon: Icons.request_quote_outlined,controller: precioControl, tipoInput: TextInputType.number,),
            SizedBox(height: 15.0),
            FutureBuilder(
              future:  CategoriaApi.instance.ListarCategoria(),
              builder: (BuildContext context,AsyncSnapshot snapshot){
                if(snapshot.hasData){
                  return DropdownWidget(
                    valor: valor, 
                    funcion: (seleccion) {
                      setState(() {
                        valor = seleccion;           
                      });
                    },
                    categorias: snapshot.data,
                  );
                }else{
                  return Center(child: CircularProgressIndicator(strokeWidth: 4,));
                }
              }
            ),
            (file == null) ? Container(
              width: 150,
              height: 100,
              child: Center(child: Text("Seleccione una imagen")),
            ) : Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:  FileImage(File(file.path))
                ),
              ),
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Seleccione una imagen',style: TextStyle(color:Color(0xff622420),fontSize: 22,fontWeight: FontWeight.w600),),
                  SizedBox(width: 8,),
                  IconButton(
                    icon: Icon(Icons.add_photo_alternate,color: Color(0xff622420),size: 40,), 
                    onPressed: () async {
                      file = await Extras.pickImage(false);
                      setState(() {
                        
                      });
                    }
                  )
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              width: double.infinity,
              child: CupertinoButton(
                color: Color(0xffE8DB65),
                child: Text( 'Guardar', style: TextStyle(color: Color(0XFF480E0A),fontSize: 18.0,fontWeight: FontWeight.bold),),
                onPressed: ()async{
                  PhotoModel photoModel;
                  if(file != null){
                    final bytes = await file.readAsBytes();
                    photoModel = await PhotoAPI.instance.uploadPhoto(bytes, file.path,context);
                  }
                  if(validarNumero(precioControl.text)){
                    if(nombreControl.text.isNotEmpty && descripcionControl.text.isNotEmpty && valor != null && double.parse(precioControl.text) > 1){
                      final isok = await ProductoApi.instance.crearProducto(nombre: nombreControl.text, descripcion: descripcionControl.text, precio: double.parse(precioControl.text),categoriaId: valor,stock: 1, model: photoModel);
                      print(isok);
                      if(isok){
                        Toast_msg("Producto creado correctamente");
                        limpiarCampos();
                      }else{
                        Toast_msg("No se puedo crear el prodcuto");
                      }
                    }else{
                      Toast_msg("Algun campo esta vacio o el precio es menor a uno");
                    }
                  }else{
                    Toast_msg("Formato no valido");
                  }
                },
              ),
            )
          ],
        ),
    );
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

  void limpiarCampos(){
    nombreControl.text = "";
    descripcionControl.text = "";
    precioControl.text = "";
  }

  bool validarNumero(String num){
    try{
      double.parse(num);
      return true;
    }catch(e){
      print(e);
      return false;
    }
  }
}