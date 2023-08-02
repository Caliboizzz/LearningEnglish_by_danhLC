import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_englishquiz/models/user.dart';
import 'package:project_englishquiz/services/database.dart';
import 'package:provider/provider.dart';
import '../result.dart';
import 'quiz.dart';
import 'dart:math';

class quizscreen extends StatefulWidget {
  final Function home;

  quizscreen({required this.home});

  @override
  _quizscreenState createState() => _quizscreenState();
}

class _quizscreenState extends State<quizscreen> {
  final _questions = const [
    {
      'questionText': 'We have two ..... We see with them.',
      'answers': [
        {'text': 'eyes', 'score': 10},
        {'text': 'legs', 'score': 0},
        {'text': 'hands', 'score': 0},
        {'text': 'ears', 'score': 0},
      ]
    },
    {
      'questionText':
          'What aspect of........... English do you find difficult?.',
      'answers': [
        {'text': 'study', 'score': 0},
        {'text': 'studied', 'score': 0},
        {'text': 'learn', 'score': 0},
        {'text': '', 'learning': 10},
      ]
    },
    {
      'questionText': 'We have lived in Hanoi.......... 4 years.',
      'answers': [
        {'text': 'in', 'score': 0},
        {'text': 'since', 'score': 0},
        {'text': 'for', 'score': 10},
        {'text': 'at', 'score': 0},
      ]
    },
    {
      'questionText':
          'Who told you of the news? The......... may not be correct.',
      'answers': [
        {'text': 'inform', 'score': 0},
        {'text': 'information', 'score': 10},
        {'text': 'informational', 'score': 0},
        {'text': 'informative', 'score': 0},
      ]
    },
    {
      'questionText': 'She thinks chatting on the Internet is time.........',
      'answers': [
        {'text': 'consume', 'score': 0},
        {'text': 'consumer', 'score': 0},
        {'text': 'consuming', 'score': 10},
        {'text': 'consumption', 'score': 0},
      ]
    },
    {
      'questionText': 'Could I speak to Susan, please?.',
      'answers': [
        {'text': 'talking', 'score': 10},
        {'text': 'speaking', 'score': 0},
        {'text': 'calling', 'score': 0},
        {'text': 'answering', 'score': 0},
      ]
    },
    {
      'questionText':
          'Is Dann in? – He’s out. Would you like to leave a ___________?.',
      'answers': [
        {'text': 'message', 'score': 10},
        {'text': 'letter', 'score': 0},
        {'text': 'telephone', 'score': 0},
        {'text': 'call', 'score': 0},
      ]
    },
    {
      'questionText': '. Look! Nam is playing very well. He__________.',
      'answers': [
        {'text': 'is winning', 'score': 0},
        {'text': 'will win', 'score': 10},
        {'text': 'is going to win ', 'score': 0},
        {'text': 'wins', 'score': 0},
      ]
    },
    {
      'questionText': 'My final attempt to fix it was___________.',
      'answers': [
        {'text': 'successful', 'score': 10},
        {'text': 'success', 'score': 0},
        {'text': 'successed', 'score': 0},
        {'text': 'successfully', 'score': 0},
      ]
    },
    {
      'questionText': 'Four and eleven is ____________.',
      'answers': [
        {'text': 'thirteen', 'score': 0},
        {'text': 'fourteen', 'score': 10},
        {'text': 'fifteen', 'score': 0},
        {'text': 'sixteen', 'score': 0},
      ]
    },
    {
      'questionText': '._________Kuala Lumpur, Ha Noi is a busy modern city.',
      'answers': [
        {'text': 'As', 'score': 0},
        {'text': 'Such as', 'score': 0},
        {'text': 'Like', 'score': 10},
        {'text': 'Similar', 'score': 0},
      ]
    },
    {
      'questionText': 'I wish I ___________his name',
      'answers': [
        {'text': 'knew', 'score': 10},
        {'text': 'know', 'score': 0},
        {'text': 'will know', 'score': 0},
        {'text': 'would know', 'score': 0},
      ]
    },
    {
      'questionText': 'We were having dinner ________ the telephone rang.',
      'answers': [
        {'text': 'since', 'score': 0},
        {'text': 'for', 'score': 0},
        {'text': 'until', 'score': 10},
        {'text': 'when', 'score': 10},
      ]
    },
    {
      'questionText': 'The________ language of Malaysia is Bahasa Malaysia',
      'answers': [
        {'text': 'international', 'score': 0},
        {'text': 'national', 'score': 10},
        {'text': 'continental', 'score': 0},
        {'text': 'country', 'score': 0},
      ]
    },
    {
      'questionText':
          '" I wish I _________stay longer," Maryam said to Lan at the end of the week.',
      'answers': [
        {'text': 'could', 'score': 10},
        {'text': 'can', 'score': 0},
        {'text': 'will', 'score': 0},
        {'text': 'may', 'score': 0},
      ]
    },
    {
      'questionText': 'The United States has a ________ of around 250 million.',
      'answers': [
        {'text': 'introduction', 'score': 0},
        {'text': 'separtation', 'score': 0},
        {'text': 'addition', 'score': 0},
        {'text': 'population', 'score': 10},
      ]
    },
    {
      'questionText': '. I______in this company for nearly ten years.',
      'answers': [
        {'text': 'work', 'score': 0},
        {'text': 'am working', 'score': 0},
        {'text': 'have worked', 'score': 10},
        {'text': 'worked', 'score': 0},
      ]
    },
    {
      'questionText':
          'I walked past several hotels ______my way ______the station.',
      'answers': [
        {'text': 'on/to', 'score': 10},
        {'text': 'on/in', 'score': 0},
        {'text': 'to/on', 'score': 0},
        {'text': 'to/in', 'score': 0},
      ]
    },
    {
      'questionText':
          'This morning, we went to Dong Xuan market without______anything',
      'answers': [
        {'text': 'buy', 'score': 0},
        {'text': 'bought', 'score': 0},
        {'text': 'to buy', 'score': 0},
        {'text': 'buying', 'score': 10},
      ]
    },
    {
      'questionText':
          'Living in the countryside is not expensive, and it isn\'t complex, ______',
      'answers': [
        {'text': 'so', 'score': 0},
        {'text': 'too', 'score': 0},
        {'text': 'either', 'score': 10},
        {'text': 'neither', 'score': 0},
      ]
    },
    {
      'questionText': 'What have you learnt since you ______ here?',
      'answers': [
        {'text': 'come', 'score': 0},
        {'text': 'is coming', 'score': 0},
        {'text': 'have come', 'score': 0},
        {'text': 'came', 'score': 10},
      ]
    },
    {
      'questionText': 'This big building was built ______ 1980 and 1983.',
      'answers': [
        {'text': 'since', 'score': 0},
        {'text': 'between', 'score': 10},
        {'text': 'from', 'score': 0},
        {'text': 'for', 'score': 0},
      ]
    },
    {
      'questionText':
          ' Our ______ resources are limited so we should recycle these used things.',
      'answers': [
        {'text': 'natural', 'score': 10},
        {'text': 'naturally', 'score': 0},
        {'text': 'nature', 'score': 0},
        {'text': 'naturing', 'score': 0},
      ]
    },
    {
      'questionText': 'Would you mind if I ______ some photos ?',
      'answers': [
        {'text': 'take', 'score': 0},
        {'text': 'took', 'score': 10},
        {'text': 'am going to take', 'score': 0},
        {'text': 'would take', 'score': 0},
      ]
    },
    {
      'questionText':
          'Internet is bringing us not only information ______ entertainment.',
      'answers': [
        {'text': 'as', 'score': 0},
        {'text': 'and', 'score': 0},
        {'text': 'although', 'score': 0},
        {'text': 'but also', 'score': 10},
      ]
    },
    {
      'questionText':
          'Put ______ in his situation, you will understand why he was so unhappy.',
      'answers': [
        {'text': 'you', 'score': 0},
        {'text': 'yourself', 'score': 10},
        {'text': 'myself', 'score': 0},
        {'text': 'herself', 'score': 0},
      ]
    },
    {
      'questionText': 'The coffee isn\'t strong ______ to keep us awake.',
      'answers': [
        {'text': 'that', 'score': 0},
        {'text': 'enough', 'score': 10},
        {'text': 'so', 'score': 0},
        {'text': 'as', 'score': 0},
      ]
    },
    {
      'questionText': 'He used to ______ soccer when he was a child..',
      'answers': [
        {'text': 'play', 'score': 10},
        {'text': 'plays', 'score': 0},
        {'text': 'playing', 'score': 0},
        {'text': 'played', 'score': 0},
      ]
    },
    {
      'questionText': 'Do you mind ______ the floor for me?',
      'answers': [
        {'text': 'clean', 'score': 0},
        {'text': 'to clean', 'score': 0},
        {'text': 'cleaned', 'score': 0},
        {'text': 'cleaning', 'score': 10},
      ]
    },
    {
      'questionText': 'Would you mind ______ I smork here?.',
      'answers': [
        {'text': 'when', 'score': 0},
        {'text': 'where', 'score': 0},
        {'text': 'if', 'score': 0},
        {'text': 'that', 'score': 10},
      ]
    },
    {
      'questionText': 'It\'s difficult ______ English well.',
      'answers': [
        {'text': 'learnt', 'score': 0},
        {'text': 'learning', 'score': 0},
        {'text': 'learn', 'score': 0},
        {'text': 'to learn', 'score': 10},
      ]
    },
    {
      'questionText':
          'Would you mind if I ______ down the music? It’s too loud here.',
      'answers': [
        {'text': 'turning', 'score': 10},
        {'text': 'turn', 'score': 0},
        {'text': 'am turning', 'score': 0},
        {'text': 'turned', 'score': 0},
      ]
    },
    {
      'questionText': 'Would you mind if I closed the door?.',
      'answers': [
        {'text': 'Please do', 'score': 10},
        {'text': 'No,I can’t do', 'score': 0},
        {'text': 'I’m sorry.I can’t', 'score': 0},
        {'text': 'Yes,I’ll do', 'score': 0},
      ]
    },
    {
      'questionText': 'It’s very difficult ______ the exam.',
      'answers': [
        {'text': 'to pass', 'score': 10},
        {'text': 'pass', 'score': 0},
        {'text': 'passing', 'score': 0},
        {'text': 'passed', 'score': 0},
      ]
    },
    {
      'questionText': 'Did it ______ in the morning?',
      'answers': [
        {'text': 'rained', 'score': 0},
        {'text': 'rain', 'score': 10},
        {'text': 'rains', 'score': 0},
        {'text': 'raining', 'score': 0},
      ]
    },
    {
      'questionText': 'I ______ on a farm when I was a boy.',
      'answers': [
        {'text': 'use live', 'score': 0},
        {'text': 'used to living', 'score': 0},
        {'text': 'used to live', 'score': 10},
        {'text': 'used live', 'score': 0},
      ]
    },
    {
      'questionText': 'Our team won the game because we play very ______',
      'answers': [
        {'text': 'good', 'score': 0},
        {'text': 'well', 'score': 10},
        {'text': 'goodly', 'score': 0},
        {'text': 'badly', 'score': 0},
      ]
    },
    {
      'questionText': 'Danh enjoys ______ the piano',
      'answers': [
        {'text': 'play', 'score': 0},
        {'text': 'playing', 'score': 10},
        {'text': 'plays', 'score': 0},
        {'text': 'played', 'score': 0},
      ]
    },
    {
      'questionText':
          'Easter is a joyful festival which ______ in many countries.',
      'answers': [
        {'text': 'is celebrated', 'score': 10},
        {'text': 'celebrates', 'score': 0},
        {'text': 'celebrated', 'score': 0},
        {'text': 'celebrating', 'score': 0},
      ]
    },
    {
      'questionText':
          '. If we ______ wasting water, there will be a shortage of fresh water in the near future',
      'answers': [
        {'text': 'turn on', 'score': 0},
        {'text': 'look for', 'score': 0},
        {'text': 'go on', 'score': 10},
        {'text': 'turn off', 'score': 0},
      ]
    },
    {
      'questionText': 'When I was a kid, I _____ travel to school by myself.',
      'answers': [
        {'text': 'use to', 'score': 0},
        {'text': 'get used to', 'score': 0},
        {'text': 'was used', 'score': 0},
        {'text': 'used to', 'score': 10},
      ]
    },
  ];

 
  

  var _index = 0;
  var _totalScore=0;
  var _totalQuestions=1;
  var showchance=3;
  var chance=0;
  var random = new Random();

  int? _getScore=0;
  String? _name='no name';

  void _resetQuiz() {
    setState(() {
      _index = 0;
      _totalScore = 0;
      _totalQuestions=1;
      chance=0;
      showchance=3;
    });
  }

  void ChangeQuestion(int score) {
    _totalScore = _totalScore + score;
    _getScore=_totalScore;
    _totalQuestions=_totalQuestions+1;
    setState(() {
      _index = random.nextInt(39);
    });
    if(score==0)
      {
        setState(() {
          showchance=showchance-1;
        });
        chance=chance+1;
        if(chance==3)
          {
            setState(() {
              _index = 41;
            });
          }
      }
    print(random.nextInt(39));
    print('diem'+_totalScore.toString());
  }

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<userdata>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _index < _questions.length
            ? Column(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
                        width: 600,
                        height: 39,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Icon(
                              Icons.favorite,
                              color: Colors.deepOrangeAccent,
                              size: 32,
                            ),
                            Text(showchance.toString(),
                                style: GoogleFonts.bungee(
                                    fontSize: 27, color: Colors.white)),
                            Container(
                              margin: EdgeInsets.all(10),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(30),
                        child: CircularCountDownTimer(
                          duration: 20,
                          initialDuration: 0,
                          controller: CountDownController(),
                          width: MediaQuery.of(context).size.width / 10,
                          height: MediaQuery.of(context).size.height / 10,
                          ringColor: Colors.black,
                          ringGradient: null,
                          fillColor: Colors.tealAccent.shade100,
                          fillGradient: null,
                          backgroundColor: Colors.deepOrangeAccent[100],
                          backgroundGradient: null,
                          strokeWidth: 10.0,
                          strokeCap: StrokeCap.butt,
                          textStyle: GoogleFonts.bungee(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          textFormat: CountdownTextFormat.S,
                          isReverse: true,
                          isReverseAnimation: false,
                          isTimerTextShown: true,
                          autoStart: true,
                          onStart: () {},
                          onComplete: () {
                            setState(() {
                              _index = 41;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Quiz(
                    answerQuestion: ChangeQuestion,
                    questionIndex: _index,
                    questions: _questions,
                  ),
                ],
              )
            : StreamBuilder<DataFromUser>(
              stream: DatabaseServices(uid: user.uid).dataFromUser,
              builder: (context, snapshot) {

                DataFromUser? dataFromUser = snapshot.data;


                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Result(_totalScore, _resetQuiz,_totalQuestions),
                    Container(
                      margin: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: TextButton(
                        onPressed: () async{
                          widget.home();
                          await DatabaseServices(uid: user.uid).updateUserData(
                              _getScore ?? dataFromUser!.scores,
                              _name ?? dataFromUser!.name
                          );
                        },
                        child: Text(
                          'Menu',
                          style: GoogleFonts.bungee(
                              color: Colors.deepOrangeAccent[100],fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                );
              }
            ),
      ],
    );
  }
}
