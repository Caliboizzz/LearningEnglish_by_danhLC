import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';


class Result extends StatefulWidget {
  final int resultScore;
  final int totalQuestions;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler, this.totalQuestions);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  double percent = 0;


  String textResult() {
    if (widget.resultScore <= 30) {
      return 'So bad!!!';
    }
    else if(widget.resultScore <= 80)
    {
      return 'Keep on trying!!';
    }
    else if(widget.resultScore <= 110)
    {
      return 'Good job!!!';
    }
    else if (widget.resultScore <= 150) {
      return 'Fantastic!!!';
    }
    else {
      return 'Fantastic!!!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 600,
          height: 500,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  /*Container(
                        width: 600,
                        height: 228,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30.0),
                              bottomRight: Radius.circular(30.0)
                            ),
                            color: Colors.grey),
                      ),

                      */



                  Container(
                    margin: EdgeInsets.fromLTRB(0, 56, 0, 0),
                    padding: EdgeInsets.all(170),
                    decoration: BoxDecoration(
                        color: Colors.white10, shape: BoxShape.circle),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 26, 0, 0),
                    padding: EdgeInsets.all(200),
                    decoration: BoxDecoration(
                        color: Colors.white10, shape: BoxShape.circle),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
                      child: SizedBox(
                          height: 150,
                          width: 150,
                          child: LiquidCircularProgressIndicator(
                            value: ((widget.resultScore / 10) /
                                widget.totalQuestions),
                            // Defaults to 0.5.
                            valueColor: AlwaysStoppedAnimation(Colors.white38),
                            // Defaults to the current Theme's accentColor.
                            backgroundColor: Colors.white24,
                            // Defaults to the current Theme's backgroundColor.
                            borderColor: Colors.grey,
                            borderWidth: 0.0,
                            direction: Axis.vertical,
                            // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                            center: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    (((widget.resultScore / 10) / widget.totalQuestions) * 100).toStringAsFixed(2) + '%',
                                    style: GoogleFonts.bungee(
                                        color: Colors.tealAccent,
                                        fontSize: 30)),
                                Text('of ' + widget.totalQuestions.toString() + ' questions',
                                    style: GoogleFonts.bungee(
                                        color: Colors.white, fontSize: 12)),
                              ],
                            ), //text inside it
                          )
                      )
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 86, 0, 0),
                    padding: EdgeInsets.all(140),
                    decoration: BoxDecoration(
                        color: Colors.white10, shape: BoxShape.circle),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 116, 0, 0),
                    padding: EdgeInsets.all(110),
                    decoration: BoxDecoration(
                        color: Colors.white10, shape: BoxShape.circle),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(35, 8, 25, 0),
                    child: Image.network('https://scontent.fsgn5-6.fna.fbcdn.net/v/t1.15752-9/263344381_484376439615383_785031651368005215_n.png?_nc_cat=106&ccb=1-5&_nc_sid=ae9488&_nc_ohc=X912rQ5SLboAX_sb5G7&_nc_ht=scontent.fsgn5-6.fna&oh=9fb02a136c4ad5ca3bd35590a47918de&oe=61CF3E61'),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 348, 10, 20),
                    child: Text(
                      textResult(),
                      style: GoogleFonts.bungeeOutline(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrangeAccent[100],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 385, 10, 20),
                    child: Text(
                      'Score',
                      style: GoogleFonts.bungee(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(8, 410, 0, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.star_rounded,
                          color: Colors.yellow,
                          size: 25,
                        ),
                        Text(widget.resultScore.toString(),
                            style: GoogleFonts.bungee(
                                fontSize: 18, color: Colors.white)),
                        Container(
                          margin: EdgeInsets.all(10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.fromSTEB(50, 10, 50, 0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  color: Colors.white38,
                  padding: const EdgeInsets.all(5),
                  onPressed: widget.resetHandler,
                  child: Text(
                    'try again',
                    style: GoogleFonts.bungee(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
