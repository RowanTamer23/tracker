import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextButtonWid extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const TextButtonWid({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          backgroundColor: Color(0xFF5A442F),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
      child: Text(text,
          style: GoogleFonts.sigmar(
            color: Color(0xFFBF9D81),
            fontSize: 18,
          )),
    );
  }
}
