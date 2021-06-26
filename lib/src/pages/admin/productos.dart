import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:montedulce_integrador/src/api/productos_api.dart';
import 'package:montedulce_integrador/src/models/Producto.dart';
import 'package:montedulce_integrador/src/pages/admin/buscar_producto.dart';
import 'package:montedulce_integrador/src/pages/admin/widget/card_widget.dart';
import 'package:montedulce_integrador/src/pages/admin/widget/titulo_widget.dart';

import 'editar_producto.dart';

class ProductoPage extends StatefulWidget {
  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.pushNamed(context, 'crearProducto');
        },
      ),
      backgroundColor: Color(0xFFFEFDE1),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TituloWidget(titulo: 'Productos'),
                _busqueda(),
                SizedBox(height: 15.0,),
                Container(
                  height: size.height * 0.75,
                  child: FutureBuilder(
                    future:  ProductoApi.instance.ListarProducto(),
                    builder: (BuildContext context,AsyncSnapshot snapshot){
                      if(snapshot.hasData){
                        return _productos(snapshot.data);
                      }else{
                        return Center(child: CircularProgressIndicator(strokeWidth: 4,));
                      }
                    }
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _busqueda(){
			return Container(
				child: TextField(
          autofocus: false,
					textAlign: TextAlign.center,
					textCapitalization: TextCapitalization.sentences,
					cursorColor: Color(0XFF480E0A),
					decoration: InputDecoration(
						contentPadding: EdgeInsets.all(10.0),
						fillColor: Colors.white,
						filled: true,
						border: OutlineInputBorder(
							borderRadius: BorderRadius.circular(10.0),
							borderSide: BorderSide.none,
						),
						hintText: 'Buscar',
						hintStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
					),
          onTap: (){
            showSearch(context: context, delegate: BuscarProducto('Buscar Producto'));
          },
				),
			);
	}

  Widget _productos (List<Producto> productos){
    return ListView.builder(
      itemCount: productos.length,
      itemBuilder: (context,index){
        final producto = productos[index];
        print(producto.imgLink);
        return CardWidget(
          titulo: producto.nombre, 
          subtitulo: "Descripcion: "+producto.descripcion, 
          subtitulo2: "Precio: "+producto.precio.toString(), 
          ruta: producto.imgLink,
          selected: (result){
            if(result == 0){
              Navigator.push(context, MaterialPageRoute(builder: (context) => EditarProductoPage(producto: productos[index],)));
            }else{
              showDialog(
                context: context, 
                builder: (context) => AlertDialog(
                  title: Text("Eliminar producto"),
                  content: Text("¿Dese eliminar este producto?"),
                  actions: [
                    FlatButton(
                      onPressed: ()async{
                        final isok = await ProductoApi.instance.eliminarProducto( id: producto.productoId );
                        print(isok);
                        Navigator.of(context).pop();
                        if(isok){
                           Fluttertoast.showToast(
                        msg: "eliminado",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,   
                        backgroundColor: Colors.red,  
                         textColor: Colors.grey  
                    );
                        }
                    },
                      child: Text("Si")
                    ),
                    FlatButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      }, 
                      child: Text("Cancelar")
                    )
                  ],
                ),
              );
            }
          },
          );
      },
    ); 
  }

}