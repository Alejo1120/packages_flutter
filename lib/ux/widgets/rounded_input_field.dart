import 'package:flutter/material.dart';
import 'package:ghost12/ux/widgets/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String text, hinText;
  final IconData icon;
  final TextInputType keyboardType;
  final double height;
  final bool? typeCaja;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  const RoundedInputField({
    required this.text,
    required this.hinText,
    required this.icon,
    required this.onChanged,
    required this.keyboardType,
    required this.height,
    this.typeCaja = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      height: height, //0.09,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: typeCaja! ? 9 : 1,
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w400,
        ),
        onChanged: onChanged,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.grey[400], fontSize: 17),
          icon: Icon(
            icon,
            color: Colors.white,
          ),
          hintStyle: TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
          labelText: text,
          hintText: hinText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
