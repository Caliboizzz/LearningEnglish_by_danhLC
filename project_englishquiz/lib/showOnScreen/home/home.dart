import 'package:animated_popup_dialog/animated_popup_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_englishquiz/services/Showscore/showname.dart';
import 'package:project_englishquiz/services/Showscore/showscore.dart';
import 'package:project_englishquiz/services/authentication.dart';
import 'package:project_englishquiz/services/database.dart';
import 'package:project_englishquiz/models/score.dart';
import 'package:provider/provider.dart';



class homescreen extends StatefulWidget {

  final Function quizmode;
  final Function correctmode;
  homescreen({required this.quizmode,required this.correctmode});


  @override
  _homescreenState createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {

  final AuthService _auth=AuthService();



  @override
  Widget build(BuildContext context) {


    return StreamProvider<List<Score>>.value(
      initialData: [],
      value: DatabaseServices(uid: '').score,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
            width: 600,
            height: 39,
            decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                showname(),
                IconButton (
                    icon: Icon(Icons.edit_outlined,color: Colors.white,size: 20,),
                    onPressed: () async {
                      String result = await Navigator.of(context).push(PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (context, _, __) {
                          return AnimatedPopupDialog.textfield(
                            title: 'change your name',
                            textFieldText: 'textFieldText',
                          );
                        },
                      ));
                    }
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 39, 0),
                    width: 100,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.star_rounded,color: Colors.yellow,size: 38,),
                        ShowScore(),
                      ],
                    )
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 6, 5),
                  child: MaterialButton(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    color: Colors.deepOrangeAccent[100],
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 5,
                    ),
                    onPressed: () async {
                      await _auth.signOut();
                    },
                    child: Text('logout',
                        style: GoogleFonts.bungee(fontSize: 12, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(15, 20, 0, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Let\'s play!!!',style: GoogleFonts.bungee(fontSize: 30,color: Colors.white),textAlign: TextAlign.left),
                    Text('Choose a category to start playing',style: GoogleFonts.bungee(fontSize: 12,color: Colors.white),textAlign: TextAlign.left),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      child: Stack(
                        children: <Widget>[
                          Ink.image(
                            image: NetworkImage('https://scontent.fsgn5-4.fna.fbcdn.net/v/t1.15752-9/255932006_2953865671502697_1741672536947810685_n.png?_nc_cat=102&ccb=1-5&_nc_sid=ae9488&_nc_ohc=MiXQY6bJlR4AX-MD4h2&_nc_ht=scontent.fsgn5-4.fna&oh=b9d0370727e900c95ed7462dc8f3d9b4&oe=61B600C9'),
                            child: InkWell(
                              onTap: () {
                                widget.correctmode();
                              },
                            ),
                            height: 180,
                            width: 160,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20.0, 120.0, 10.0, 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Correct',style: GoogleFonts.bungee(fontSize: 20,color: Colors.white),),
                                Text('word',style: GoogleFonts.bungee(fontSize: 12,color: Colors.white),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      child: Stack(
                        children: <Widget>[
                          Ink.image(
                            image: NetworkImage(
                                'https://scontent.fsgn5-8.fna.fbcdn.net/v/t1.15752-9/257402303_609466460285582_2676820804506311474_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=ae9488&_nc_ohc=KIaIMXyWT18AX-oLJ7M&tn=egzAuwHg6lrXpSyL&_nc_ht=scontent.fsgn5-8.fna&oh=9db87225219c2958ea99b8aae179cfe1&oe=61B76170',),
                            child: InkWell(
                              onTap: () {},
                            ),
                            height: 180,
                            width: 160,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20.0, 120.0, 10.0, 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('result',style: GoogleFonts.bungee(fontSize: 20,color: Colors.white),),
                                Text('of corret word',style: GoogleFonts.bungee(fontSize: 12,color: Colors.white),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(30),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(30),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      child: Stack(
                        children: <Widget>[
                          Ink.image(
                            image: NetworkImage(
                                'https://scontent-xsp1-1.xx.fbcdn.net/v/t1.15752-9/248200487_4783638148355424_7736189997059189057_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=ae9488&_nc_ohc=qgoS_D2FzygAX9ayyI7&_nc_oc=AQk90XnVc6vZZuo9YqkbQo1a3dAc52U0fp5xvGPeyEP_AVcqOntYe1JE4XGUwNdoI3UsuENDPLbJ996I6NU6cvoZ&_nc_ht=scontent-xsp1-1.xx&oh=8f345c643eb43161acc8a6a6906960f3&oe=61B79DCE'),
                            child: InkWell(
                              onTap: () {
                                  widget.quizmode();
                              },
                            ),
                            height: 180,
                            width: 160,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20.0, 120.0, 10.0, 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Quiz',style: GoogleFonts.bungee(fontSize: 20,color: Colors.white),),
                                Text('game',style: GoogleFonts.bungee(fontSize: 12,color: Colors.white),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      child: Stack(
                        children: <Widget>[
                          Ink.image(
                            image: NetworkImage(
                                'https://scontent-xsp1-2.xx.fbcdn.net/v/t1.15752-9/257297493_433155758428105_6263873635101022348_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=ae9488&_nc_ohc=wgNq5jHlw2EAX_svfUz&tn=egzAuwHg6lrXpSyL&_nc_ht=scontent-xsp1-2.xx&oh=9228a35cb572e8e9f8f2fa7339e9218b&oe=61B4F3D3'),
                            child: InkWell(
                              onTap: () {},
                            ),
                            height: 180,
                            width: 160,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20.0, 120.0, 10.0, 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('result',style: GoogleFonts.bungee(fontSize: 20,color: Colors.white),),
                                Text('of quiz game',style: GoogleFonts.bungee(fontSize: 12,color: Colors.white),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
