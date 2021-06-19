import 'package:flutter/material.dart';
import 'package:montedulce_integrador/src/api/categoria_api.dart';
import 'package:montedulce_integrador/src/models/categoria.dart';
import 'package:montedulce_integrador/src/pages/admin/editar_categoria.dart';
import 'package:montedulce_integrador/src/pages/admin/widget/card_widget.dart';
import 'package:montedulce_integrador/src/pages/admin/widget/titulo_widget.dart';
class CategoriasPage extends StatefulWidget {
  @override
  _CategoriasPageState createState() => _CategoriasPageState();
}

class _CategoriasPageState extends State<CategoriasPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.pushNamed(context, 'crearCategoria');
        },
      ),
      backgroundColor: Color(0xFFFEFDE1),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TituloWidget(titulo: 'Categorias'),
                SizedBox(height: 15.0,),
                Container(
                  height: size.height*0.75,
                  child: FutureBuilder(
                    future:  CategoriaApi.instance.ListarCategoria(),
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

  Widget _productos (List<Categoria> categorias){
    return ListView.builder(
      itemCount: categorias.length,
      itemBuilder: (context,index){
        final categoria = categorias[index];
        return CardWidget(
          titulo: categoria.nombre, 
          subtitulo: "Descripcion: "+categoria.descripcion, 
          subtitulo2: '', 
          ruta: null,
          selected: (result){
            if(result == 0){
              Navigator.push(context, MaterialPageRoute(builder: (context) => EditarCategoriaPage(categoria: categorias[index])));
            }else{
              showDialog(
                context: context, 
                builder: (context) => AlertDialog(
                  title: Text("Eliminar producto"),
                  content: Text("¿Dese eliminar este producto?"),
                  actions: [
                    FlatButton(
                      onPressed: ()async{
                        final isok = await CategoriaApi.instance.eliminarCategoria( id: categoria.categoriaId );
                        print(isok);
                        Navigator.of(context).pop();
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