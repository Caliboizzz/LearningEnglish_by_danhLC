import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_englishquiz/models/score.dart';
import 'package:provider/provider.dart';

class showname extends StatefulWidget {


  @override
  State<showname> createState() => _shownameState();
}

class _shownameState extends State<showname> {
  String name='';

  @override
  Widget build(BuildContext context) {

    final showScore=Provider.of<List<Score>?>(context) ?? [];


    showScore.forEach((show) {
      setState(() {
        name=show.name;
      });
    });

    return Text(name,style: GoogleFonts.bungee(fontSize: 16, color: Colors.white));
  }
}
