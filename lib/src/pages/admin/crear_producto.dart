import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:montedulce_integrador/src/api/categoria_api.dart';
import 'package:montedulce_integrador/src/api/productos_api.dart';
import 'package:montedulce_integrador/src/pages/admin/widget/dropdown_widget.dart';
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
            Input(hinText: 'Precio',icon: Icons.request_quote_outlined,controller: precioControl),
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
                        print("ID ->" + seleccion + " valor->" + valor);                
                      });
                    },
                    categorias: snapshot.data,
                  );
                }else{
                  return Center(child: CircularProgressIndicator(strokeWidth: 4,));
                }
              }
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
            SizedBox(height: 10.0),
            Container(
              width: double.infinity,
              child: CupertinoButton(
                color: Color(0xffE8DB65),
                child: Text( 'Guardar', style: TextStyle(color: Color(0XFF480E0A),fontSize: 18.0,fontWeight: FontWeight.bold),),
                onPressed: ()async{
                  final isok = await ProductoApi.instance.crearProducto(nombre: nombreControl.text, descripcion: descripcionControl.text, precio: double.parse(precioControl.text),categoriaId: valor,stock: 1);
                  print(isok);
                  if(isok){
                      Fluttertoast.showToast(
                        msg: "creado correctamente",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,   
                        backgroundColor: Colors.red,  
                         textColor: Colors.grey  
                    );
                  }else{
                    Fluttertoast.showToast(
                        msg: "Ingrese los campos correctamente",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,   
                        backgroundColor: Colors.red,  
                         textColor: Colors.grey  
                    );
                  }
                },
              ),
            )
          ],
        ),
    );
  }
}