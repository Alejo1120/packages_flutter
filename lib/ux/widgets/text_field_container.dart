import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final double height;
  const TextFieldContainer({
    required this.child,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.9,
      height: size.height * height,
      decoration: BoxDecoration(
        color: Color(0xff5c01b6),
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
