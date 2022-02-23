import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  // final Color? color;
  final Widget? child;
  final double? borderRadius;
  final double? paddingVert;
  final double? paddingHoriz;

  PrimaryButton(
      {this.text = "",
        this.onPressed,
        // this.color = Color(0xff00D998),
        this.child,
        this.borderRadius = 10,
        this.paddingVert = 10.4,
        this.paddingHoriz = 0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 45,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: const Color(0xff00D998),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        child: Text(text!),
      ),
    );
  }
}
