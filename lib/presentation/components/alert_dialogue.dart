import 'package:flutter/material.dart';

class AlertDialogue extends StatelessWidget {
  final VoidCallback func;
  const AlertDialogue({super.key, required this.func});

//   Future<void> _showMyDialog() async {
//   return showDialog<void>(
//     context: context,
//     barrierDismissible: false, // user must tap button!
//     builder: (BuildContext context) {
//       return
//     },
//   );
// }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Player Wins'),
      content: const SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Congrats You have won'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Play Again'),
          onPressed: () {
            Navigator.of(context).pop();
            func();
          },
        ),
      ],
    );
  }
}
