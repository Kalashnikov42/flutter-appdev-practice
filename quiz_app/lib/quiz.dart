import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start-button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';
class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen'; 

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen'; 
    });
  }
  
  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
   // print(answer);
   // print('  ');

   if(selectedAnswers.length == questions.length){
   
      setState(() {
        activeScreen = 'results-screen';
      });
   }
  }
  @override
  Widget build(context) {
    Widget screenWidget = StartScreen();

    if(activeScreen == 'questions-screen'){
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    if(activeScreen == 'results-screen'){
      screenWidget = ResultScreen(chosenAnswers: selectedAnswers);
    }
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 100, 3, 100),
        body: Center(
          child: screenWidget, 
        ),
      ),
    );
  }
}

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          height: 300,
          color: const Color.fromARGB(115, 255, 255, 255),
        ),
        const SizedBox(height: 60),
        const Text(
          'Learn Flutter the Fun Way!',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        const SizedBox(height: 60),
        StartQuizButton(
          onPressed: () {
            final parentState = context.findAncestorStateOfType<_QuizState>();
            parentState?.switchScreen(); 
          },
        ),
      ],
    );
  }
}
