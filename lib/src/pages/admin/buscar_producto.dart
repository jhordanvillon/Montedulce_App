import 'package:flutter/material.dart';
import 'package:montedulce_integrador/src/api/productos_api.dart';
import 'package:montedulce_integrador/src/models/Producto.dart';
import 'package:montedulce_integrador/src/pages/admin/editar_producto.dart';
import 'package:montedulce_integrador/src/pages/admin/widget/card_widget.dart';


class BuscarProducto extends SearchDelegate<Producto>{
  
  @override
  final String searchFieldLabel;

  BuscarProducto(this.searchFieldLabel);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear, color: Color(0XFF480E0A),), onPressed: () => this.query= ''),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back, color: Color(0XFF480E0A)), onPressed: () => this.close(context,null));
  }

  @override
  Widget buildResults(BuildContext context) {

    if( query.trim().length == 0){
      return Text('no hay valor en el query');
    }

    return FutureBuilder(
      future: ProductoApi.instance.buscarProducto(nombre: query),
      builder: (BuildContext context,AsyncSnapshot snapshot){
        if(snapshot.hasData){
          return _productos(snapshot.data);
        }else{
          return Center(child: CircularProgressIndicator(strokeWidth: 4,));
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('');
  }

  Widget _productos (List<Producto> productos){
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context,index){
          final producto = productos[index];
          return CardWidget(
            titulo: producto.nombre, 
            subtitulo: "Descripcion: "+producto.descripcion, 
            subtitulo2: "Precio: "+producto.precio.toString(), 
            ruta: producto.imgLink,
            selected: (result){
              if(result == 0){
                Navigator.push(context, MaterialPageRoute(builder: (context) => EditarProductoPage(producto: productos[index],)));
              }else{
                print("eliminar");
              }
            },
            );
        },
        
        ),
    ); 
  }
  
}