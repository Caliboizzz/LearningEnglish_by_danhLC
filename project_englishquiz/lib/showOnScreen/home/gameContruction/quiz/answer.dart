import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Answer extends StatelessWidget {
  final Function selectAnswer;
  final String answerText;

  Answer(this.selectAnswer,this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10.0, 10, 0),
      child:  Row(
        children: <Widget>[
          Expanded(
            child: MaterialButton(
              shape: const RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(10.0)),
              ),
              color: Colors.white38,
              padding: const EdgeInsets.all(12),
              onPressed: (){selectAnswer();},
              child: Text(
                answerText,
                style: GoogleFonts.bungee(fontSize: 20,color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}