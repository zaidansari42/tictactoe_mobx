import 'package:flutter/material.dart';
import 'package:tictactoe_mobx/logic/tictactoe.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../components/tile.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Tictac tictac = Tictac();

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
            const SizedBox(
              height: 90,
            ),
            Observer(builder: (context) {
              return Text(
                'Player Turn: ${tictac.currentPlayerX ? 'X' : 'O'}',
                style: const TextStyle(fontSize: 40),
              );
            }),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, mainAxisSpacing: 5, crossAxisSpacing: 5),
                itemBuilder: (context, index) => Observer(builder: (context) {
                  return InkWell(
                      onTap: tictac.data[index] != ""
                          ? null
                          : () {
                              tictac.afterClicking(index, context);
                            },
                      child: Tile(
                          index: index, status: tictac.currentStatus[index]));
                }),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: tictac.resetGame,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
