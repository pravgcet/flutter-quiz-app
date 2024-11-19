import 'package:flutter_quiz_app/questions_screen.dart';
import 'package:flutter_quiz_app/result_screen.dart';
import 'package:flutter_quiz_app/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/content.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  final List<String> selectedAnswers = [];

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      selectedAnswers.clear();
      activeScreen = QuestionsScreen(selectedAnswer: addAnswer);
    });
  }

  void addAnswer(String ans) {
    selectedAnswers.add(ans);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultScreen(
          selectedAnswers: selectedAnswers,
          startOver: switchScreen,
        );
      });
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 113, 52, 124),
              Color.fromARGB(255, 186, 5, 223),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
