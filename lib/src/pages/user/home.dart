import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:montedulce_integrador/src/api/productos_api.dart';
import 'package:montedulce_integrador/src/models/Producto.dart';
import 'package:montedulce_integrador/src/pages/user/detail.dart';
import 'package:montedulce_integrador/src/widgets/card_widget.dart';
import 'package:montedulce_integrador/src/widgets/menu_widget.dart';

import 'cart.dart';


class HomePage extends StatefulWidget {

  HomePage({Key key, }) : super(key: key);
	@override
	_HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

	final colorMarron = Color(0XFF480E0A);

	String _opcion = 'Mas reciente';
	List<String> _opciones = ['Mas reciente','Mayor precio','Menor Precio'];
  List<Producto> _listaCarro = [];

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
							//_busqueda(),
              SizedBox(height: 25.0,),
							//_ordenarPor(),
							FutureBuilder(
                future:  ProductoApi.instance.ListarProducto(),
                builder: (BuildContext context,AsyncSnapshot snapshot){
                  if(snapshot.hasData){
                    return _productos(snapshot.data);
                  }else{
                    return Center(child: CircularProgressIndicator(strokeWidth: 4,));
                  }
                }
              ),
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
      margin: EdgeInsets.only(top: 8.0),
		  child: GestureDetector(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Icon(Icons.shopping_cart,size: 35,),
          if (_listaCarro.length > 0)
            Padding(
              padding: const EdgeInsets.only(left: 2.0),
              child: CircleAvatar(
                radius: 8.0,
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                child: Text(_listaCarro.length.toString(),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),),
              ),
            ),
        ],
      ),
      onTap: () {
        if (_listaCarro.isNotEmpty){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartPage(cart: _listaCarro,),),);
        }
      },
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

  Widget _productos (List<Producto> productos){
    return Expanded(
      child: GridView.builder(
        itemCount: productos.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.84, 
        ), 
        itemBuilder: (context, index) {
          var item = productos[index];
          return CardProduct(
            boton: CupertinoButton(
              color: Color(0xFFE8DB65),
              borderRadius: BorderRadius.circular(3.0),
              padding: EdgeInsets.only( right: 5.0,left: 5.0),
              child: (!_listaCarro.contains(item)) ? Text('Agregar',style: TextStyle(color: colorMarron, fontSize: 12.0,fontWeight: FontWeight.bold),) : Text('Quitar',style: TextStyle(color: colorMarron, fontSize: 12.0,fontWeight: FontWeight.bold),), 
              onPressed: (){
                setState(() {
                  if(!_listaCarro.contains(item)){
                    _listaCarro.add(item);
                    print("No lo contiene");    
                  }else if(_listaCarro.contains(item)){
                    _listaCarro.remove(item);
                    print("Lo contiene");
                  }         
                });
              },
			      ),
            producto: productos[index],
            press: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailProduct(producto: productos[index],))),
          );
        } 
      )
    );
  }
}



