import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracker/main.dart';

class TextButtonWid extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const TextButtonWid({super.key, required this.text, required this.onPressed});

  @override
  State<TextButtonWid> createState() => _TextButtonWidState();
}

class _TextButtonWidState extends State<TextButtonWid> {
  bool get isLightMode => Theme.of(context).brightness == Brightness.light;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      style: TextButton.styleFrom(
          backgroundColor:
              isLightMode ? Color(0xFF5A442F) : KColorSchemeDark.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
      child: Text(widget.text,
          style: GoogleFonts.sigmar(
            color: isLightMode ? Color(0xFFBF9D81) : KColorSchemeDark.onPrimary,
            fontSize: 18,
          )),
    );
  }
}
