import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
   const StyledText({super.key});

   @override
   build(context){
      return Text(
              'Dice Application',
              style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'San Francisco',
                  color: Colors.white),
            );
   }
}