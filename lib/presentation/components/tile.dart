import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  const Tile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridTile(
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    width: 5,
                    color: Theme.of(context).colorScheme.inversePrimary),
                borderRadius: BorderRadius.circular(20)),
            child: const Center(
                child: Text(
              'X',
              style: TextStyle(fontSize: 40),
            ))));
  }
}
