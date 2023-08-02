import 'package:flutter/material.dart';
import '../question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, dynamic>> questions;
  final Function answerQuestion;
  final int questionIndex;

  Quiz(
      {required this.questions,
        required this.answerQuestion,
        required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
            width: 500,
            height: 210,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
                    child: listQuestion(questions[questionIndex]['questionText'])),
              ],
            )),
        ...(questions[questionIndex]['answers'] as List<Map<String, dynamic>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList(),
      ],
    );
  }
}