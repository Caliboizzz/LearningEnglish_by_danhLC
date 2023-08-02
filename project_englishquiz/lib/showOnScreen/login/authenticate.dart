import 'package:flutter/material.dart';
import 'package:project_englishquiz/showOnScreen/login/register.dart';
import 'loginscreen.dart';

class authen extends StatefulWidget {

  @override
  _authenState createState() => _authenState();
}

class _authenState extends State<authen> {
  bool ShowSignIn=true;
  void toggleScreen(){
    setState(() {
      ShowSignIn=!ShowSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(ShowSignIn==true){
      return loginscreen(toggleScreen: toggleScreen);
    }
    else{
      return register(toggleScreen: toggleScreen);
    }
  }
}
