import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:montedulce_integrador/src/api/categoria_api.dart';
import 'package:montedulce_integrador/src/models/categoria.dart';
import 'package:montedulce_integrador/src/pages/admin/widget/titulo_widget.dart';
import 'package:montedulce_integrador/src/widgets/input_widget.dart';

class EditarCategoriaPage extends StatefulWidget {

  final Categoria categoria;

  EditarCategoriaPage({Key key, this.categoria}) : super(key: key);

  @override
  _EditarCategoriaPageState createState() => _EditarCategoriaPageState();
}

class _EditarCategoriaPageState extends State<EditarCategoriaPage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color(0xFFFEFDE1),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  TituloWidget(titulo: 'Editar Categoria',),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: _Form(categoria: widget.categoria,)
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {

  final Categoria categoria;

  _Form({Key key, this.categoria}) : super(key: key);

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {

  String id;

  final nombreControl = TextEditingController();
  final descripcionControl = TextEditingController();

  @override
  Widget build(BuildContext context) {

    nombreControl.text = widget.categoria.nombre;
    descripcionControl.text = widget.categoria.descripcion;
    id = widget.categoria.categoriaId;

    return Container(
      child: Column(
          children: [
            Input(hinText: 'Nombre',icon: Icons.cake_outlined, controller: nombreControl),
            SizedBox(height: 15.0),
            Input(hinText: 'Descripción',icon: Icons.description_outlined, controller: descripcionControl),
            SizedBox(height: 15.0),
            Container(
              width: 100,
              height: 100,
              child: Image(
                fit: BoxFit.fitHeight,
                image:AssetImage('assets/torta1.png')
              ),
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Torta Chocolate.jpg',style: TextStyle(color:Color(0xff622420),fontSize: 22,fontWeight: FontWeight.w600),),
                  SizedBox(width: 25,),
                  IconButton(
                    icon: Icon(Icons.add_photo_alternate,color: Color(0xff622420),size: 40,), 
                    onPressed: (){}
                  )
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              width: double.infinity,
              child: CupertinoButton(
                color: Color(0xffE8DB65),
                child: Text( 'Guardar', style: TextStyle(color: Color(0XFF480E0A),fontSize: 18.0,fontWeight: FontWeight.bold),),
                onPressed: ()async{
                  final isok = await CategoriaApi.instance.editarCategoria(nombre: nombreControl.text, descripcion: descripcionControl.text,id: id);
                  print(isok);
                },
              ),
            )
          ],
        ),
    );
  }
}