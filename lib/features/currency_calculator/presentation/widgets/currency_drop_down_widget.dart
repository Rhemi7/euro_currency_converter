import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String currency;
  final String image;

  const CustomTextWidget(
      {Key? key, required this.currency, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          radius: 10,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(image),
            )),
          ),
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
