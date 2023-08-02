import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_englishquiz/models/user.dart';
import 'package:project_englishquiz/services/database.dart';
import 'package:project_englishquiz/showOnScreen/home/gameContruction/question.dart';
import 'package:project_englishquiz/showOnScreen/home/gameContruction/result.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class correctwordscreen extends StatefulWidget {
  final Function home;

  correctwordscreen({required this.home});

  @override
  _correctwordscreenState createState() => _correctwordscreenState();
}

class _correctwordscreenState extends State<correctwordscreen> {
  final List<Map<String, dynamic>> _questions = const [
    {
      'questionText': 'a/c/t/i/v/i/t/y',
      'answer':'activity'
    },
    {
      'questionText': 't/e/s/t',
      'answer':'test'
    },
    {
      'questionText': 'g/o/o/d',
      'answer':'good'
    },
  ];

  int randNumber({required int min, required int max}) =>
      min + Random().nextInt(max - min + 1);

  List<int> randNumbers(int length, {required int min, required int max}) {
    final numbers = Set<int>();

    while (numbers.length < length) {
      final number = randNumber(min: min, max: max);
      numbers.add(number);
    }
    return List.of(numbers);
  }

  get list => randNumbers(8, min: 0, max: 40);

  get number => (list..shuffle()).first;

  final controller= TextEditingController();
  var _index = 0;
  var _totalScore=0;
  var _totalQuestions=1;
  String answerText='';
  var random = new Random();

  int? _getScore=0;
  String? _name='';

  void _resetQuiz() {
    setState(() {
      _index = 0;
      _totalScore = 0;
      _totalQuestions=1;
    });
  }

  void ChangeQuestion() {
    if(answerText==_questions[_index]['answer'])
    {
      _totalScore= _totalScore+10;
    }
    else
    {
      _totalScore= _totalScore+0;
    }
    _getScore=_totalScore;
    _totalQuestions=_totalQuestions+1;
    setState(() {
      _index = random.nextInt(2)+1;
    });
    print(_totalScore);
    print('cau hoi '+_questions[_index]['answer']);
    print('cau tra loi '+answerText);
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
            listQuestion(_questions[_index]['questionText']),
            Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 80)),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(16)),
                child: TextFormField(
                  controller: controller,
                  cursorColor: Colors.white,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration.collapsed(
                    hintStyle: GoogleFonts.bungee(
                      color: Colors.white,
                    ),
                    hintText: 'Enter your answer',
                  ),
                  onChanged: (value) {
                    answerText = value;
                  },
                ),
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 18)),
            MaterialButton(
              shape: const RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(30.0))),
              color: Colors.deepOrangeAccent[100],
              padding: EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 12,
              ),
              onPressed: () {
                ChangeQuestion();
                controller.clear();
              },
              child: Text(
                'enter',
                style: GoogleFonts.bungee(fontSize: 30,color: Colors.white),
              ),
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