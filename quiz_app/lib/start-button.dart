import 'package:flutter/material.dart';

class StartQuizButton extends StatelessWidget {
  final VoidCallback onPressed;

  const StartQuizButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:  Color.fromARGB(255, 100, 3, 100),
       // padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        
      ),
      icon: Icon(Icons.arrow_right_alt , color: Colors.white,),
      label: const Text(
        'Start Quiz',
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
      ),
    );
  }
}