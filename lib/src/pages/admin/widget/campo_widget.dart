import 'package:flutter/material.dart';

class CampoWidget extends StatefulWidget {
  final String nombre;
  final TextEditingController controller;
  final TextInputType inputType;

  const CampoWidget({Key key, this.nombre, this.controller, this.inputType}) : super(key: key);
  @override
  _CampoWidgetState createState() => _CampoWidgetState();
}

class _CampoWidgetState extends State<CampoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.inputType,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Color(0xff622420), fontSize: 24),
          hintText: widget.nombre,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff622420)),
          ),
        ),
      ),
    );
  }
}
