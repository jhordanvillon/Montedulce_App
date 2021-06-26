

import 'package:flutter/material.dart';

class Input extends StatefulWidget {

  final Function(String) validator;
  TextEditingController controller;
  String hinText, initialValue;
  IconData icon;
  bool fill,enabled;
  Color fillColor;
  Input({
    Key key,
    this.controller,
    this.hinText,
    this.fill,
    this.fillColor,
    this.initialValue,
    this.enabled,
    this.validator,
    @required this.icon

  }) : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      enabled: widget.enabled,
      controller: widget.controller,
      decoration: InputDecoration(
        filled: widget.fill,
        fillColor: widget.fillColor,
        contentPadding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 0.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: widget.hinText,
        prefixIcon: Icon(widget.icon)
      ),
      
    );
  }
}