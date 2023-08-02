import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class listQuestion extends StatelessWidget {
  final String questionText;
  listQuestion(this.questionText);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          questionText,
          style: GoogleFonts.bungee(
              fontSize: 20, color: Colors.white),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}