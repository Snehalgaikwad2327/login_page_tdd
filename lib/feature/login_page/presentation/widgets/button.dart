// ignore_for_file: sort_child_properties_last, use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final onpress;
  const CustomButton({required this.text, required this.onpress});

  @override
  State<CustomButton> createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: MaterialButton(
      height: 50.0,
      minWidth: 200,
      elevation: 30.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      color: const Color.fromARGB(255, 74, 187, 195),
      child: Text(
        widget.text,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black),
      ),
      onPressed: widget.onpress,
    ));
  }
}
