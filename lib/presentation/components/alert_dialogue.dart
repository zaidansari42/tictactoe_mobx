import 'package:flutter/material.dart';

class AlertDialogue extends StatelessWidget {
  final VoidCallback resetFunc;
  final String winner;
  const AlertDialogue(
      {super.key, required this.resetFunc, required this.winner});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(winner == 'draw' ? 'Its a draw!' : 'Player $winner Wins'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(winner == 'draw'
                ? 'Hard Luck, Its a draw. Try Again!'
                : 'Congrats, Player $winner has won the game!'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Play Again'),
          onPressed: () {
            resetFunc();
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
