
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_widgets.dart';
import 'package:quiz_app/results_screen.dart';

var startAlignment = Alignment.topLeft;
var endAlignment = Alignment.bottomRight;

class Quiz extends StatefulWidget{

  const Quiz({super.key});


  @override
  State<Quiz> createState() {
    return _QuizState();
  }


}

class _QuizState extends State<Quiz>{
  List<String> selectedAnswers=[];
  var activeScreen='start-screen';

  void switchScreen(){
    setState(() {
      selectedAnswers=[];
      activeScreen='questions-screen';
    });
  }

  void chooseAnswers(String answer ){
    selectedAnswers.add(answer);

    if(selectedAnswers.length==questions.length){
      setState(() {
        activeScreen='results-screen';
      });
    }

  }


  @override
  Widget build(BuildContext context) {

    Widget screenWidget=StartWidgets(switchScreen);

    if(activeScreen=='questions-screen'){
      screenWidget=QuestionsScreen(chooseAnswers);  
    }

    if(activeScreen=='results-screen'){
      screenWidget=ResultsScreen(selectedAnswers,switchScreen);
    }
       

    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: const [
                Color.fromARGB(255, 79, 9, 200),
                Color.fromARGB(255, 112, 63, 197)
              ], begin: startAlignment, end: endAlignment),
            ),
            child:screenWidget, 
          ),
      ),
    );
  }

}