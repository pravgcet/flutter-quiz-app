import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
        child: Column(
      children: [
        SizedBox(height: 50),
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 200,
          color: Color.fromARGB(150, 255, 255, 255),
        ),
        SizedBox(height: 100),
        Text(
          'Learn Flutter the Fun way',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        SizedBox(height: 100),
        OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: Icon(Icons.arrow_right_alt),
            label: Text('Start Quiz'))
      ],
    ));
  }
}
