import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_englishquiz/services/authentication.dart';

class loginscreen extends StatefulWidget {
  final Function toggleScreen;
  loginscreen({required this.toggleScreen});

  @override
  _loginscreenState createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {

  final AuthService _auth=AuthService();
  final _formKey= GlobalKey<FormState>();

  String email='';
  String password='';
  String alert='';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(15, 50, 15, 0),
            child: Image.asset('assets/asset1.png'),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Text(alert,
                style: GoogleFonts.firaSansExtraCondensed(color: Colors.red)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              decoration: BoxDecoration(
                  color: Colors.white24, borderRadius: BorderRadius.circular(16)),
              child: TextFormField(
                cursorColor: Colors.white,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration.collapsed(
                  hintStyle: GoogleFonts.bungee(
                    color: Colors.white,
                  ),
                  hintText: 'Email',
                ),
                validator: (value)=> value!.isEmpty?'Enter an email':null,
                onChanged: (value){
                  setState(() {
                    email=value;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              decoration: BoxDecoration(
                  color: Colors.white24, borderRadius: BorderRadius.circular(16)),
              child: TextFormField(
                cursorColor: Colors.white,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration.collapsed(
                  hintStyle: GoogleFonts.bungee(
                    color: Colors.white,
                  ),
                  hintText: 'Password',
                ),
                obscureText: true,
                onChanged: (value){
                  setState(() {
                    password=value;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              child: MaterialButton(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                color: Colors.deepOrangeAccent[100],
                padding: EdgeInsets.symmetric(
                  horizontal: 100,
                  vertical: 12,
                ),
                onPressed: () async {
                  dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                  if(result==null)
                    {
                      setState(() {
                        alert = 'Account not exist';
                      });
                    }
                },
                child: Text('login',
                    style: GoogleFonts.bungee(fontSize: 25, color: Colors.white)),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text('Don\'t have an account?',
                style: GoogleFonts.firaSansExtraCondensed(color: Colors.white)),
          ),
          Container(
            child: TextButton(
              onPressed: () {
                widget.toggleScreen();
              },
              child: Text(
                'Register now',
                style: GoogleFonts.firaSansExtraCondensed(
                    color: Colors.tealAccent[100]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
