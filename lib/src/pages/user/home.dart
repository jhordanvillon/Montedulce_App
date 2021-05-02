import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:montedulce_integrador/src/models/Product.dart';
import 'package:montedulce_integrador/src/widgets/card_widget.dart';
import 'package:montedulce_integrador/src/widgets/menu_widget.dart';


class HomePage extends StatefulWidget {
	@override
	_HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

	final colorMarron = Color(0XFF480E0A);

	String _opcion = 'Mas reciente';
	List<String> _opciones = ['Mas reciente','Mayor precio','Menor Precio'];

	@override
	Widget build(BuildContext context) {

		final size = MediaQuery.of(context).size;
    
		return Scaffold(
			backgroundColor: Color(0xFFFEFDE1),
			appBar: AppBar(
					elevation: 0,
					backgroundColor: Colors.transparent,
					iconTheme: IconThemeData(color: colorMarron),
					actions: [
						_verCarrito(),
					],
				),
			drawer: SafeArea(child: MenuWidget()),
			body: Container(
				padding: EdgeInsets.symmetric(horizontal: 10.0),
				child: Theme(
					data: ThemeData(
						accentColor: Color(0xff010130),
					),
					child: Column(
						children: [
							_busqueda(),
							_ordenarPor(),
							Expanded(
                child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    /* mainAxisSpacing: 20,
                    crossAxisSpacing: 15, */
                    childAspectRatio: 0.84, 
                  ), 
                  itemBuilder: (context, index) => CardProduct(
                    product: products[index],
                  ),
                )
              )
						],
					),			
				),
			),
		);
	}

	Widget _busqueda(){
			return Container(
				padding: EdgeInsets.symmetric(horizontal: 15.0),
				child: TextField(
					textAlign: TextAlign.center,
					textCapitalization: TextCapitalization.sentences,
					cursorColor: colorMarron,
					decoration: InputDecoration(
						contentPadding: EdgeInsets.all(10.0),
						fillColor: Colors.white,
						filled: true,
						border: OutlineInputBorder(
							borderRadius: BorderRadius.circular(10.0),
							borderSide: BorderSide.none,
						),
						hintText: 'Que buscas',
						hintStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
						//suffixIcon: Icon(Icons.search, color: colorMarron,),
					)
				),
			);
	}

	Widget _verCarrito(){
		return Container(
			padding: EdgeInsets.only(right: 10.0),
			child: IconButton(
					icon: Icon(Icons.shopping_cart, size: 35.0,),
					onPressed: (){}, 
			),
		);
	}

	Widget _ordenarPor(){
		return Container(
			padding: EdgeInsets.only(top: 25.0,left: 15.0,right: 15.0),
			child: Row(
				children: <Widget>[
					Text('Ordenar por:',style: TextStyle(fontSize: 17.0,color: colorMarron),),
					SizedBox(width: 10.0,),
					DropdownButton(
						value: _opcion,
						items: getItems(),
						onChanged: (opt){
							setState(() {
								_opcion = opt;
							});
						},
						icon: Icon(Icons.keyboard_arrow_down, color: colorMarron,),
					),
				],
			),
		);
	}

	List<DropdownMenuItem<String>> getItems(){

		List<DropdownMenuItem<String>> lista = new List();

		_opciones.forEach((opcion) { 
			lista.add(
				DropdownMenuItem(
				child: Text(opcion, style: TextStyle(color: colorMarron,fontSize: 17.0),),
				value: opcion,
				)
				);
		});

		return lista;
	}

}



