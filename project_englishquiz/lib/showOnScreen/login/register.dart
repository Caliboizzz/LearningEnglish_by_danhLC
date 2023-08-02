import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_englishquiz/services/authentication.dart';

class register extends StatefulWidget {
  final Function toggleScreen;
  register({required this.toggleScreen});

  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {

  final  AuthService _auth=AuthService();
  final _formKey= GlobalKey<FormState>();

  String email='';
  String password='';
  String confirmPassword='';
  String alert='';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10, 20, 0, 20),
            child: Row(
              children: <Widget>[
                IconButton(
                    onPressed: (){
                      widget.toggleScreen();
                    },
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                ),
              ],
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
                  hintText: 'Email',
                ),
                validator: (value){
                  value!.isEmpty ? 'Enter an email':null;
                },
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
                  hintText: 'Confirm password',
                ),
                obscureText: true,
                onChanged: (value){
                  setState(() {
                    confirmPassword=value;
                  });
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Text(alert,
                style: GoogleFonts.firaSansExtraCondensed(color: Colors.white)),
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
                  if(password!=confirmPassword)
                    {
                      setState(() {
                        alert='Confirm password is no correct!!!';
                        confirmPassword='';
                      });
                    }
                  else{
                    dynamic result = await _auth.createUserWithEmailAndPassword(email, password);
                    setState(() {
                      alert='Register success';
                    });
                    if(result==null){
                      setState(() {
                        alert='email not correct!!';
                      });
                    }
                  }
                },
                child: Text('register & login',
                    style: GoogleFonts.bungee(fontSize: 19, color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


