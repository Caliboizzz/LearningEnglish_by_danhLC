import 'package:flutter/material.dart';
import 'package:project_englishquiz/showOnScreen/home/home.dart';
import 'gameContruction/correctWords/correctwordscreen.dart';
import 'gameContruction/quiz/quizscreen.dart';

class gamescreen extends StatefulWidget {

  @override
  _gamescreenState createState() => _gamescreenState();
}

class _gamescreenState extends State<gamescreen> {
  int modeScreen=0;


  void quizmode(){
    setState(() {
      modeScreen=1;
    });
    print(modeScreen);
  }

  void correctmode(){
    setState(() {
      modeScreen=2;
    });
    print(modeScreen);
  }
  
  void home(){
    setState(() {
      modeScreen=0;
    });
    print(modeScreen);
  }


  @override
  Widget build(BuildContext context) {
    if(modeScreen==0)
      {
        return homescreen(quizmode: quizmode,correctmode: correctmode);
      }
    else if(modeScreen==2)
      {
        return correctwordscreen(home: home);
      }
    else{
      return quizscreen(home: home);
    }
  }
}
