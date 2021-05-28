import 'package:flutter/material.dart';

class TextFieldVerify extends StatelessWidget {
  const TextFieldVerify();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xff5c01b6), width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: TextField(
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
          maxLength: 1,
          keyboardType: TextInputType.phone,
          maxLines: 1,
          style: TextStyle(
            color: Color(0xff5c01b6),
            fontSize: 23,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintStyle: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Color(0xff5c01b6),
            ),
            hintText: '*',
            border: InputBorder.none,
            counterText: '',
          ),
        ),
      ),
    );
  }
}
