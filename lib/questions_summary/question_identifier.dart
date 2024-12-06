import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget{

  const QuestionIdentifier(this.questionIndex,this.isCorrectAnswer,{super.key});

  final int questionIndex;

  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    final questionNumber=questionIndex+1;
    return Container(
      margin: const EdgeInsets.all(10),
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAnswer 
        ? Color.fromARGB(255, 120, 214, 243) 
        : Color.fromARGB(255, 240, 131, 167),
        borderRadius: BorderRadius.circular(100)
      ),
      child: Text(
        questionNumber.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 43, 42, 42),  

        ),
      ),
    );
  }

}