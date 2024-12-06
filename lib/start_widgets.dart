import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartWidgets extends StatelessWidget {
  final void Function() startQuiz;

  const StartWidgets(this.startQuiz, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 275,
            color: Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 50),
          const Text(
            'Learn Flutter the fun Way!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              'Start Quiz',
            ),
          ),
        ],
      ),
    );
  }
}
