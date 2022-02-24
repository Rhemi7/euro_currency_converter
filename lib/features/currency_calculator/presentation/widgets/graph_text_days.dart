


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GraphTextDays extends StatelessWidget {
  final String days;
  const GraphTextDays(this.days, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          days,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 5,
        ),
        const CircleAvatar(
          radius: 2,
          backgroundColor: Color(0xff00D899),
        )
      ],
    );
  }
}
