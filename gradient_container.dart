import 'package:acakdadu/styled_text.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget{
 GradientContainer (this.color1, this.color2,{super.key});

  final Color color1;
  final Color color2;

  var activeDiceImage = 'assets/dice-2.png';

  void rollDice() {

    activeDiceImage = 'assets/dice-4.png';
  }

  @override
  Widget build(context){
    return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors:[color1, color2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            )
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                StyledText(),
                ElevatedButton(
                  onPressed: rollDice,
                  child: const Text('Roll Dice'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.only(
                      top: 20,
                    ),
                    foregroundColor: const Color.fromARGB(247, 42, 126, 0),
                    textStyle: const TextStyle(fontSize: 30),
                  ),
                ) 
              ],
            ),
          )
        );
  }
}