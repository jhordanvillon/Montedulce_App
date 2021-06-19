
import 'package:flutter/material.dart';
import 'package:montedulce_integrador/src/models/categoria.dart';


class DropdownWidget extends StatefulWidget {
  const DropdownWidget({
    Key key,
    @required this.valor,
    @required this.categorias,
    @required this.funcion,
  }) : super(key: key);

  final String valor;
  final List<Categoria> categorias;
  final Function funcion;

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey,width: 0.8),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: DropdownButton(
        hint: Text('Selecciona una categoria'),
        dropdownColor: Colors.white,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 36,
        isExpanded: true,
        value: widget.valor,
        onChanged: widget.funcion,
        style: TextStyle(color: Colors.black,fontSize: 18),
        items: widget.categorias.map((item){
          return DropdownMenuItem(
            value: item.categoriaId,
            child: Text(item.nombre)
          );
        }).toList(),
      ),
    );
  }
}