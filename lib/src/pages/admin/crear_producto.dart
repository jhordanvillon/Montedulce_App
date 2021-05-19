import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:montedulce_integrador/src/pages/admin/widget/campo_widget.dart';
import 'package:montedulce_integrador/src/pages/admin/widget/titulo_widget.dart';
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
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TituloWidget(titulo: 'Crear Producto',),
                  Container(
                    height: size.height*0.8,
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
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Column(
          children: [
            CampoWidget(
              nombre: 'Nombre',
            ),
            CampoWidget(
              nombre: 'Descripcion',
            ),
            CampoWidget(
              nombre: 'Precio',
            ),
            CampoWidget(
              nombre: 'Stock',
            ),
            Container(
              width: 100,
              height: 100,
              child: Image(
                fit: BoxFit.fitHeight,
                image:AssetImage('assets/torta1.png')
              ),
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Torta Chocolate.jpg',style: TextStyle(color:Color(0xff622420),fontSize: 22,fontWeight: FontWeight.w600),),
                  SizedBox(width: 25,),
                  IconButton(
                    icon: Icon(Icons.add_photo_alternate,color: Color(0xff622420),size: 40,), 
                    onPressed: (){}
                  )
                ],
              ),
            ),
            Expanded(child: Container()),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 150,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: Color(0xffFEFDE1),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text('Eliminar',style: TextStyle(color: Color(0xff622420),fontSize: 18,fontWeight: FontWeight.bold),),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    width: 150,
                    decoration: BoxDecoration(
                      color: Color(0xffE8DB65),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text('Guardar',style: TextStyle(color: Color(0xff622420),fontSize: 18,fontWeight: FontWeight.bold),),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
    );
  }
}