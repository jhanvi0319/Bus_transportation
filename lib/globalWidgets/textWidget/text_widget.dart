import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget text(text, fontSize, textColor,
    {fontWeight = FontWeight.w400,
    shadowColor = Colors.white,
    blurRadius = 0.0,
    textDecoration = TextDecoration.none}) {
  return Text(
    text,
    style: GoogleFonts.poppins(
        decoration: textDecoration,
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        shadows: [Shadow(color: shadowColor, blurRadius: blurRadius)]),
  );
}
