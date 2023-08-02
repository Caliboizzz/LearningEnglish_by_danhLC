import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_englishquiz/models/score.dart';
import 'package:provider/provider.dart';

class ShowScore extends StatefulWidget {


  @override
  _ShowScoreState createState() => _ShowScoreState();
}

class _ShowScoreState extends State<ShowScore> {

  int getScore=0;

  @override
  Widget build(BuildContext context) {
    
    final showScore=Provider.of<List<Score>?>(context) ?? [];


    showScore.forEach((show) {
      setState(() {
        getScore=show.scores;
      });
    });

    return Text(getScore.toString(),style: GoogleFonts.bungee(fontSize: 23, color: Colors.white));
  }
}
