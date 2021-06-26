import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:montedulce_integrador/src/api/boleta_api.dart';
import 'package:montedulce_integrador/src/models/boleta.dart';
import 'package:montedulce_integrador/src/widgets/card_mis_pedidos.dart';

class DetallePedidoPage extends StatefulWidget {

  final String boletaID;
  

  DetallePedidoPage({Key key, this.boletaID  }) : super(key: key);

  @override
  _DetallePedidoPageState createState() => _DetallePedidoPageState();
}

class _DetallePedidoPageState extends State<DetallePedidoPage> {

  final stiloLetra=TextStyle(color:Color(0XFF480E0A),fontSize: 20,);
  final stiloTitulto=TextStyle(color:Color(0XFF480E0A),fontSize: 30,);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffFEFDE1),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Text('Detalle Pedido',style: stiloTitulto)
                ),
                Container(
                  height: size.height*0.85,
                  decoration: BoxDecoration(
                    color:Color(0xfff3f3f3),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),   
                  ),
                  child: Column(
                    children: [
                    Container(
                      height: size.height*0.65,
                      margin: EdgeInsets.all(10.0),
                      child: FutureBuilder(
                        future: BoletaApi.instance.obtenerBoleta(idBoleta: widget.boletaID),
                        builder: (BuildContext context, AsyncSnapshot<Boleta> snapshot) {
                          if(snapshot.hasData){
                            final boleta = snapshot.data;
                            return _boletaItems(snapshot.data);
                          }else{
                            return Center(child: CircularProgressIndicator(strokeWidth: 4,));
                          }
                        },
                      ),
                    ),             
                  ],
                ),
              ),
            ],
          )
        ),
      ),
    );
  }

  Widget _boletaItems(Boleta boleta){
    return ListView.builder(
      itemCount: boleta.items.length,
      itemBuilder: (context,index){
        final boletaItem = boleta.items[index];
        return CardPedidoWidget(
          titulo: boletaItem.producto.nombre, 
          subtitulo: "cantidad: " + boletaItem.cantidad.toString(), 
          subtitulo2: "precio: " + boletaItem.producto.precio.toString(), 
          ruta: boletaItem.producto.imgLink,
          selected: (){}, 
          );
      },
    ); 
  }

  

}

