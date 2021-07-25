import 'package:flutter/material.dart';
import 'package:montedulce_integrador/src/api/clientes_api.dart';
import 'package:montedulce_integrador/src/models/clientes.dart';
import 'package:montedulce_integrador/src/pages/admin/widget/titulo_widget.dart';
import 'package:montedulce_integrador/src/widgets/card_mis_pedidos.dart';
class UsuariosPage extends StatefulWidget {
  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.pushNamed(context, 'crearUsuario');
        },
      ),
      backgroundColor: Color(0xFFFEFDE1),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TituloWidget(titulo: 'Usuarios'),
                SizedBox(height: 15.0,),
                Container(
                  height: size.height*0.75,
                  child: FutureBuilder(
                    future:  ClientesApi.instance.ListarCliente(),
                    builder: (BuildContext context,AsyncSnapshot snapshot){
                      if(snapshot.hasData){
                        return _clientes(snapshot.data);
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

   Widget _clientes (List<Cliente> clientes){
    return ListView.builder(
      itemCount: clientes.length,
      itemBuilder: (context,index){
        final cliente = clientes[index];
        return CardPedidoWidget(
          titulo: cliente.nombreCompleto, 
          subtitulo: "Rol: "+ cliente.adminNameRole, 
          subtitulo2: (cliente.email.length < 12 ) ? "correo: " + cliente.email :  "correo: " + cliente.email.substring(0,12), 
          ruta: null,
          selected: (){},
          );
      },
    ); 
  }
}