import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:montedulce_integrador/src/api/categoria_api.dart';
import 'package:montedulce_integrador/src/api/productos_api.dart';
import 'package:montedulce_integrador/src/models/Producto.dart';
import 'package:montedulce_integrador/src/pages/admin/widget/dropdown_widget.dart';
import 'package:montedulce_integrador/src/pages/admin/widget/titulo_widget.dart';
import 'package:montedulce_integrador/src/widgets/input_widget.dart';

class EditarProductoPage extends StatefulWidget {
  
  final Producto producto;

  EditarProductoPage({Key key, this.producto}) : super(key: key);
  @override
  _EditarProductoPageState createState() => _EditarProductoPageState();
}

class _EditarProductoPageState extends State<EditarProductoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEFDE1),
      body: SingleChildScrollView(
        child: GestureDetector(
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  TituloWidget(titulo: 'Editar Producto',),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: _Form(producto: widget.producto,)
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

class _Form extends StatefulWidget{

  final Producto producto;

  _Form({Key key, this.producto}) : super(key: key);

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {

  final nombreControl = TextEditingController();
  final descripcionControl = TextEditingController();
  final precioControl = TextEditingController();
  String valor;
  String id;

  @override
  Widget build(BuildContext context) {

    nombreControl.text = widget.producto.nombre;
    descripcionControl.text = widget.producto.descripcion;
    precioControl.text = widget.producto.precio.toString();
    valor = widget.producto.categoriaId;
    id = widget.producto.productoId;

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
                      });
                    },
                    categorias: snapshot.data,
                  );
                }else{
                  return Center(child: CircularProgressIndicator(strokeWidth: 4,));
                }
              }
            ),
            /* Container(
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
            ), */
            SizedBox(height: 10.0),
            Container(
              width: double.infinity,
              child: CupertinoButton(
                color: Color(0xffE8DB65),
                child: Text( 'Guardar', style: TextStyle(color: Color(0XFF480E0A),fontSize: 18.0,fontWeight: FontWeight.bold),),
                onPressed: ()async{
                  final isok = await ProductoApi.instance.editarProducto( nombre: nombreControl.text, descripcion: descripcionControl.text, precio: double.parse(precioControl.text),categoriaId: valor,stock: 1, id: id);
                  print(isok);
                  if(isok){
                    Toast_msg("Editado correctamente");
                  }else{
                    Toast_msg("Ingrese los campos correctamente");
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
}

