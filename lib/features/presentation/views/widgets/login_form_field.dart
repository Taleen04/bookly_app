import 'package:flutter/material.dart';

class LoginFormField extends StatefulWidget {
  const LoginFormField(
      {super.key,
      required this.height,
      required this.width,
      required this.icon,
      required this.controller,
      required this.validator,
      required this.text});

  final double height;
  final double width;
  final String text;
  final Icon icon;

  final String? Function(String?)? validator;

  final TextEditingController controller;

  @override
  State<LoginFormField> createState() => _LoginFormFieldState();
}

class _LoginFormFieldState extends State<LoginFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        style: const TextStyle(
            color: Colors.white,
            //Color.fromRGBO(255, 255, 255, 0.698)
            fontSize: 16),
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          prefixIcon: widget.icon,
          contentPadding: const EdgeInsets.only(top: 40, left: 40),
          constraints: BoxConstraints(
            maxHeight: widget.height * 0.065,
            maxWidth: widget.width,
          ),
          labelText: widget.text,
          labelStyle: const TextStyle(color: Colors.white, fontSize: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(color: Colors.orange, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(color: Colors.orange, width: 1.0),
          ),
        ),
        cursorColor: Colors.orange,
      ),
    );
  }
}
