import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
   @override
   State<DiceRoller> createState() {
      return _DiceRollerState();
   }
}

class _DiceRollerState extends State<DiceRoller> {
   var activeDiceImage = 'assets/images/Dice-2.png';
  
  void rollDice() {
     var diceRoll = randomizer.nextInt(6) + 1;
     setState((){
        activeDiceImage = 'assets/images/Dice-$diceRoll.png';
     });
  }

   @override
   Widget build(context) {
      
      return  Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              activeDiceImage,
              width: 200,
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: rollDice,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 32,
                ),
              ),
              child: const Text('Roll Dice',),
            )
          ],
        );
   }
}