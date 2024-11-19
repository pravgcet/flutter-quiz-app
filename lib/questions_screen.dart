import 'package:flutter_quiz_app/answer_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/content.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.selectedAnswer});

  final void Function(String ans) selectedAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  var currentIndex = 0;

  void answered(String ans) {
    widget.selectedAnswer(ans);
    setState(() {
      currentIndex++;
    });
  }

  @override
  Widget build(context) {
    final q = questions[currentIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
                child: Text(
              q.question,
              style: TextStyle(color: Colors.white, fontSize: 24),
            )),
            SizedBox(
              height: 20,
            ),
            ...q.getOptionsShuffled().map((a) {
              return Option(
                text: a,
                onTap: () {
                  answered(a);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
