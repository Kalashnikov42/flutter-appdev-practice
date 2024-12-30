import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key, required this.onSelectAnswer,});
  
  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() {
       return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen>{
 var currentQuestionIndex = 0;

 void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex+=1; 
    });
 } 

@override
  Widget build(context) {
     final currentQuestion = questions[currentQuestionIndex]; 
     return SizedBox(
      width: double.infinity,
      child: Container(
      margin: const EdgeInsets.all(20),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
       Text(currentQuestion.text ,textAlign: TextAlign.center , style: const TextStyle(color: Colors.white , fontSize: 21,),),
       const SizedBox(height: 30,),
       ...currentQuestion.getShuffledAnswers().map((answer) {
         return AnswerButton(answerText: answer, onTap: (){
             answerQuestion(answer);
         });
       }),
      ],
     )
     ));
  }
} 


