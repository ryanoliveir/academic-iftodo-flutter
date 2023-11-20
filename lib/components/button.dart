import 'package:flutter/material.dart';


class ButtonCustom extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  ButtonCustom({
    required this.text,
    required this.onPressed,
    super.key
  }); 

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed, 
      color: Theme.of(context).primaryColor,
      child: Text(text),
    );
  }
}
