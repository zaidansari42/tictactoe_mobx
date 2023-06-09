import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final int index;
  final List<String> status;

  const Tile({super.key, required this.index, required this.status});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                width: 5, color: Theme.of(context).colorScheme.inversePrimary),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            status[index],
            style: const TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}
