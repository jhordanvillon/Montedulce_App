import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:montedulce_integrador/src/api/pedido_api.dart';
import 'package:montedulce_integrador/src/models/ItemBoleta.dart';
import 'package:montedulce_integrador/src/models/Producto.dart';
import 'package:montedulce_integrador/src/service/stripe_sevice.dart';
import 'package:montedulce_integrador/src/widgets/carrito_card_widget.dart';
class CartPage extends StatefulWidget {
  @override
  final List<Producto> cart;

  CartPage({Key key, this.cart}) : super(key: key);
  _CartPageState createState() => _CartPageState(this.cart);

}

class _CartPageState extends State<CartPage> {

  _CartPageState(this._cart);
  List<Producto> _cart;
  List<Item> _items;

  final stiloLetra=TextStyle(color:Color(0XFF480E0A),fontSize: 20,);
  final stiloTitulto=TextStyle(color:Color(0XFF480E0A),fontSize: 30,);
  int _cantidad = 1;

  String valorTotal(List<Producto> listaProductos){
    double total = 0.0;
    for(int i = 0; i < listaProductos.length; i++){
      total = total + listaProductos[i].precio * listaProductos[i].cantidad;
    }
    return total.toStringAsFixed(2);
  }

  double valorTotalNumerico(List<Producto> listaProductos){
    double total = 0.0;
    for(int i = 0; i < listaProductos.length; i++){
      total = total + listaProductos[i].precio * listaProductos[i].cantidad;
    }
    return total;
  }

  List<Item> listaItems(List<Producto> listaproductos){
    List<Item> items = [];
    for(var listaproducto in listaproductos){
      var item = new Item(productoId: listaproducto.productoId,cantidad: listaproducto.cantidad );
      items.add(item);
    }
    return items;
  }

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
                  child: Text('Resumen de Pedido',style: stiloTitulto)
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
                      height: size.height*0.6,
                      child: ListView.builder(
                        itemCount: _cart.length,
                        itemBuilder: (context,index){
                          var item = _cart[index];
                          return CarritoItemCard(
                            producto: item,
                            anadir: (){
                              _anadir(index);
                              valorTotal(_cart);
                            },
                            remover: (){
                              _remove(index);
                              valorTotal(_cart);
                            },
                          );
                        }
                      )
                    ),     
                    _infoPago(_cart)            
                  ],
                ),
              ),
            ],
          )
        ),
      ),
    );
  }

  Widget _infoPago(List<Producto> _cart){
    final stripeService = new StripeService();
    return Container(
      margin: EdgeInsets.only(top:25),
      padding: EdgeInsets.symmetric(horizontal:13),
      
      child: Container(
        padding: EdgeInsets.symmetric(horizontal:20,vertical:15),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3.0,
              blurRadius: 5.0
            )
          ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Text('Total',style: stiloLetra),
                Text('S/${valorTotal(_cart)}',style: stiloLetra),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top:20),
              child: CupertinoButton(
                padding: EdgeInsets.only(top: 0.0, bottom: 0.0, right: 80,left: 80),
                color: Color(0xFFE8DB65),
                child: Text('Comprar Ahora', style: TextStyle(color: Color(0XFF480E0A),fontWeight: FontWeight.bold),), 
                onPressed: () async {
                  final valor = valorTotalNumerico(_cart);
                  final valorReal = valor * 100 ;
                  //final valorEntero = int.parse(valorReal);
                  print(valorReal.toString().split("."));
                  final valorString = valorReal.toString().split(".");
                  print(valorString[0]);

                  final response = await stripeService.payToCart(amount: valorString[0], currency: 'USD');
                  if(response.ok){
                    print(response.id);
                  }
                  print(listaItems(_cart).length);
                  final pedido = await PedidoApi.instance.crearPedido( codigoPago: response.id , tipoPedido: "Pendiente" , item: listaItems(_cart));
                  print("pedido "+ pedido.toString() );
                  
                  if(pedido){
                    Toast_msg("Producto realizado");
                    Navigator.pushNamed(context, 'misPedidos');
                  }
                  
                }
              )
            )
          ],
        ),
      ),
    );
  }

  _anadir(int index) {
    setState(() {
      _cart[index].cantidad++;
    });
  }

  _remove(int index) {
    setState(() {
      if(_cart[index].cantidad > 1){
        _cart[index].cantidad--;
      }else{
        _cart[index].cantidad = 1;
      }
    });
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




