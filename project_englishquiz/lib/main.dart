import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_englishquiz/models/user.dart';
import 'package:project_englishquiz/services/authentication.dart';
import 'package:project_englishquiz/wrap.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<userdata?>.value(
        value: AuthService().user,
        catchError: (_,__)=>null,
        initialData: null,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            resizeToAvoidBottomInset: false,
            body:Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://i.pinimg.com/564x/4e/af/8f/4eaf8fc272d7ac046d63bae9fb6a43a9.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: wrapper(),
            ),
          ),
        ),
      );
  }
}