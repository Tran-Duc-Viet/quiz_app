import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final bool isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
            (itemData['question_index'] as int), (isCorrectAnswer)),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              itemData['questions'] as String,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              itemData['user_answer'] as String,
              style: GoogleFonts.lato(
                color: Color.fromARGB(255, 189, 156, 247),
                fontSize: 15,
              ),
            ),
            Text(
              itemData['correct_answer'] as String,
              style: GoogleFonts.lato(
                color: Color.fromRGBO(188, 242, 190, 1),
                fontSize: 15,
              ),
            ),
          ]),
        )
      ],
    );
    ;
  }
}
