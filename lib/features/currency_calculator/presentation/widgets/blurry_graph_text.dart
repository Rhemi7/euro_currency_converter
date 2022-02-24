import 'package:flutter/material.dart';

class BlurryGraphText extends StatelessWidget {
  final String text;
  const BlurryGraphText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: Color(0xff3D8EED)),
    );
  }
}