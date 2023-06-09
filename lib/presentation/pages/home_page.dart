import 'package:flutter/material.dart';
import 'package:tictactoe_mobx/presentation/components/alert_dialogue.dart';

import '../components/tile.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> data = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  bool checkifAlreadyFilled(index) {
    return (data[index] == 'X' || data[index] == 'O');
  }

  bool currentPlayerX = true;

  void switchPlayer() {
    currentPlayerX = !currentPlayerX;
  }

  void checkForWin() {
    if (data[0] == data[1] &&
        data[1] == data[2] &&
        data[0] == data[2] &&
        data[0] != '') {
      _showMyDialog();
    }
    if (data[3] == data[4] &&
        data[4] == data[5] &&
        data[3] == data[5] &&
        data[3] != '') {
      _showMyDialog();
    }
    if (data[6] == data[7] &&
        data[7] == data[8] &&
        data[6] == data[8] &&
        data[6] != '') {
      _showMyDialog();
    }
    if (data[0] == data[4] &&
        data[4] == data[8] &&
        data[0] == data[8] &&
        data[0] != '') {
      _showMyDialog();
    }
    if (data[2] == data[4] &&
        data[4] == data[6] &&
        data[2] == data[6] &&
        data[2] != '') {
      _showMyDialog();
    }
    if (data[0] == data[3] &&
        data[3] == data[6] &&
        data[0] == data[6] &&
        data[0] != '') {
      _showMyDialog();
    }
    if (data[1] == data[4] &&
        data[4] == data[7] &&
        data[1] == data[7] &&
        data[1] != '') {
      _showMyDialog();
    }
    if (data[2] == data[5] &&
        data[5] == data[8] &&
        data[2] == data[8] &&
        data[2] != '') {
      _showMyDialog();
    }
  }

  void resetGame() {
    setState(() {
      data = [
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
        '',
      ];
    });

    currentPlayerX = true;
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialogue(
          func: resetGame,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Tic Tac Toe',
            ),
            const SizedBox(
              height: 90,
            ),
            Text(
              'Player Turn: ${currentPlayerX ? 'X' : 'O'}',
              style: const TextStyle(fontSize: 40),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, mainAxisSpacing: 5, crossAxisSpacing: 5),
                itemBuilder: (context, index) => InkWell(
                    splashColor: checkifAlreadyFilled(index)
                        ? Colors.transparent
                        : const Color.fromARGB(29, 117, 117, 117),
                    onTap: () {
                      if (checkifAlreadyFilled(index)) return;
                      setState(() {
                        data[index] = currentPlayerX ? 'X' : 'O';
                      });
                      checkForWin();
                      switchPlayer();
                    },
                    child: Tile(index: index, status: data)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
