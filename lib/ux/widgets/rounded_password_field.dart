import 'package:flutter/material.dart';
import 'package:ghost12/ux/widgets/text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {
  final String text;
  final TextEditingController? controller;
  final ValueChanged<String> onChanged;

  const RoundedPasswordField({
    required this.text,
    required this.onChanged,
    this.controller,
  });
  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool obscureText = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      height: 0.1,
      child: TextField(
        controller: widget.controller!,
        onChanged: widget.onChanged,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: widget.text,
          hintText: '********',
          hintStyle: TextStyle(color: Colors.white),
          labelStyle: TextStyle(color: Colors.grey[400], fontSize: 18),
          icon: Icon(
            Icons.lock,
            color: Colors.white,
          ),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              icon: Icon(
                Icons.visibility,
                color: Colors.white,
              )),
          border: InputBorder.none,
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
