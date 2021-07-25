import 'package:flutter/material.dart';
import 'package:montedulce_integrador/src/api/pedido_api.dart';
import 'package:montedulce_integrador/src/models/pedido.dart';

import 'package:montedulce_integrador/src/pages/admin/widget/titulo_widget.dart';
import 'package:montedulce_integrador/src/pages/user/detalle_pedido.dart';
import 'package:montedulce_integrador/src/widgets/card_mis_pedidos.dart';

class AdminPedidosPage extends StatefulWidget {
  @override
  _AdminPedidosPageState createState() => _AdminPedidosPageState();
}

class _AdminPedidosPageState extends State<AdminPedidosPage> {
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: (){
          Navigator.pushNamed(context, 'adminHome');
        },
      ),
      backgroundColor: Color(0xFFFEFDE1),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TituloWidget(titulo: 'Pedidos'),
                SizedBox(height: 15.0,),
                Container(
                  height: size.height * 0.75,
                  child: FutureBuilder(
                    future:  PedidoApi.instance.PedidosAdmin(),
                    builder: (BuildContext context,AsyncSnapshot snapshot){
                      if(snapshot.hasData){
                        return _pedidos(snapshot.data);
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

  Widget _pedidos (List<Pedido> pedidos){
    return ListView.builder(
      itemCount: pedidos.length,
      itemBuilder: (context,index){
        final pedido = pedidos[index];
        return CardPedidoWidget(
          titulo: pedido.fechaCreacion.toString(), 
          subtitulo: "Estado: " + pedido.tipoPedido, 
          subtitulo2: (pedido.codigoPago == null) ? "Codigo de pago: ": "Codigo de pago: "+pedido.codigoPago.substring(0,5), 
          ruta: null,
          selected: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetallePedidoPage(boletaID: pedido.boletaId, usuarioId: pedido.usuarioId, codigoPago: pedido.codigoPago.toString(),)));
          }, 
          );
      },
    ); 
  }
  
}