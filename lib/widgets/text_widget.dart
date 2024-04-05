

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key,
    required this.text,
    this.color,
    this.fontSize = 10,
    this.fontWeight = FontWeight.w600,
    this.textOverflow, 
  }) : super(key: key);

  final String text;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.baloo2(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        
      ),
      overflow: textOverflow,
    );
  }
}
