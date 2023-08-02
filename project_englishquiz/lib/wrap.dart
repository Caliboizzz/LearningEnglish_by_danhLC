import 'package:flutter/material.dart';
import 'package:project_englishquiz/models/user.dart';
import 'package:project_englishquiz/showOnScreen/home/gamescreen.dart';
import 'package:project_englishquiz/showOnScreen/login/authenticate.dart';
import 'package:provider/provider.dart';

class wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final userdata? user = Provider.of<userdata?>(context);

    if(user == null)
      {
        return authen();
      }
    else
      {
        return gamescreen();
      }
  }
}

