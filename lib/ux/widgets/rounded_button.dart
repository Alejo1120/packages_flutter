import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback? press;
  final Color color, textColor;
  final double width;
  final double height;
  final double fontSize;

  const RoundedButton({
    required this.text,
    this.press,
    required this.color,
    required this.textColor,
    required this.width,
    required this.height,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * width,
      height: size.height * height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        // ignore: deprecated_member_use
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
          color: Color(0xff5c01b6),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: size.height * fontSize,
            ),
          ),
          onPressed: press!,
        ),
      ),
    );
  }
}
