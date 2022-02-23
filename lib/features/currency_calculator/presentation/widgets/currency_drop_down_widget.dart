import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
 final String currency;

  const CustomTextWidget({Key? key, required this.currency}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const CircleAvatar(
          radius: 10,
        ),
       const SizedBox(
          width: 15,
        ),
        Text(
          currency,
          style: const TextStyle(
              color: Color(0xff8C8C8C),
              fontWeight: FontWeight.bold,
              fontSize: 17.0),
        ),
      ],
    );
  }
}
