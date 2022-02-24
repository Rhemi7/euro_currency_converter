

import 'package:flutter/cupertino.dart';

import '../utils/constants.dart';

class CurrencyCalculatorText extends StatelessWidget {
  const CurrencyCalculatorText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
          text: 'Currency\nCalculator',
          style: TextStyle(
              color: Color(0xff2479DF),
              fontWeight: FontWeight.bold,
              fontSize: 35),
          children: [
            TextSpan(
                text: '.',
                style: TextStyle(
                    color: kColorGreen, fontSize: 35.0))
          ]),
    );
  }
}