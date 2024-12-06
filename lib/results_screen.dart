import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/questions_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.chosenAnswers,this.restartQuiz,{super.key});

  final void Function() restartQuiz;

  final List<String> chosenAnswers;

  List<Map<String,Object>> getSummaryData(){
    final List<Map<String,Object>> summary=[];

    for(var i = 0;i<chosenAnswers.length;i++){
      summary.add({
        'question_index': i,
        'questions': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer':chosenAnswers[i]
         
      });
    } 


    return summary;
  }


  @override
  Widget build(BuildContext context) {
    final summaryData=getSummaryData();
    final numTotalQuestion=questions.length;
    final numCorrectAnswer=summaryData.where((data){

      return (data['user_answer']== data['correct_answer']);
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectAnswer out of $numTotalQuestion questions correctly!'
              ),
            const SizedBox(height:30),
            QuestionsSummary(summaryData),
            TextButton.icon(
              onPressed: restartQuiz,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz!'),
            ),
          ]
          ),
      ),
    );
  }
}
