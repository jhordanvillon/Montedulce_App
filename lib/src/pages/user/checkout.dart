import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:montedulce_integrador/src/service/stripe_sevice.dart';
import 'package:montedulce_integrador/src/widgets/input_widget.dart';

class CheckoutPage extends StatefulWidget {
  CheckoutPage({Key key}) : super(key: key);
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {

  final colorMarron = Color(0XFF480E0A);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFFEFDE1),
      body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _titulo(),
                  SizedBox(height: 10.0,),
                  _imagenCheckout(),
                  SizedBox(height: 5.0,),
                  Text('\$650',style: TextStyle(fontSize: 40.0,color: colorMarron),),
                  SizedBox(height: 5.0,),
                  Text('DETALLES DE LA TARJETA DE CREDITO', style: TextStyle(color: colorMarron, fontSize: 16.5),),
                  SizedBox(height: 30.0,),
                  _inputs(),
                  SizedBox(height: 15.0,),
                  _botonPagar(),
                ],
              ),
            ),
          ),
      )
    );
  }

  Widget _titulo() {
    return Container(
      child: Text('Completar\n Transacción', style: TextStyle(color: colorMarron, fontSize: 40.0, height: 1.2), textAlign: TextAlign.center,),
    );
  }

  Widget _imagenCheckout() {
    return Image(
      fit: BoxFit.cover,
      image: AssetImage('assets/checkout.png'),
      height: 130.0,
    ); 
  }

  Widget _inputs(){
    return Column(
      children: [
        Input(hinText: 'Numero de tarjeta', icon: Icons.credit_card,),
        SizedBox(height: 15.0,),
        Input(hinText: 'Nombre del titular', icon: Icons.person_outline,),
        SizedBox(height: 15.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(child: Input(hinText: 'Fecha de expiración', icon: Icons.date_range,)),
            SizedBox(width: 10.0,),
            Container(width: 105.0, child: Flexible(child: Input(hinText: 'cvv', icon: Icons.vpn_key_outlined,))),
          ],
        )
      ],
    );
  }

  Widget _botonPagar(){
    
    return Container(
      width: double.infinity,
      child: CupertinoButton(
        color: Color(0xFFE8DB65),
        child: Text('Pagar', style: TextStyle(color: colorMarron,),), 
        onPressed: () async {
         

        }
      ),
    );
  }
}

