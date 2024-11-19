import 'package:flutter_quiz_app/answer_btn.dart';
import 'package:flutter_quiz_app/data/content.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.selectedAnswers, required this.startOver});

  final void Function() startOver;
  final List<String> selectedAnswers;

  String get score {
    int sc = 0;
    for (int i = 0; i < questions.length; i++) {
      if (questions[i].options[0] == selectedAnswers[i]) {
        sc++;
      }
    }
    return sc.toString() + '/' + questions.length.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Your Quiz result is ready',
            style: GoogleFonts.eduNswActFoundation(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            'Your score is $score',
            style: GoogleFonts.eduNswActFoundation(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Option(text: 'Start Again', onTap: startOver)
        ],
      ),
    );
  }
}
