import 'package:coshion/app/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.isPrimary});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(vertical: 14, horizontal: 26)),
        foregroundColor: MaterialStateProperty.all<Color>(
            isPrimary ? Colors.white : colorPrimary),
        backgroundColor: MaterialStateProperty.all<Color>(
            isPrimary ? colorPrimary : Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            color:
                isPrimary ? const Color(0xFF0E8388) : const Color(0xFF0E8388),
          ),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: "Satoshi",
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
