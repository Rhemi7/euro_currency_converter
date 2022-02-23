import 'package:flutter/material.dart';

class CurrencyDropdownWidget extends StatelessWidget {
  const CurrencyDropdownWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 7.0),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffF2F2F2), width: 2),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            CircleAvatar(
              radius: 10,
            ),
            Text(
              'EUR',
              style: TextStyle(
                  color: Color(0xff8C8C8C),
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Color(0xff8C8C8C),
            )
          ],
        ),
      ),
    );
  }
}
