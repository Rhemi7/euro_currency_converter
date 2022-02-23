import 'package:flutter/material.dart';

class TestTextField extends StatelessWidget {
  final TextEditingController controller;
  final String suffixText;

  const TestTextField(
      {Key? key, required this.controller, required this.suffixText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 13.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            isCollapsed: true,
            isDense: true,
            filled: true,
            fillColor: const Color(0xffFAFAFA),
            contentPadding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.0),
            suffixStyle:
            const TextStyle(color: Color(0xffC8C8C8), fontSize: 15.0),
            suffixText: suffixText,
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.white),
            )),
      ),
    );
  }
}