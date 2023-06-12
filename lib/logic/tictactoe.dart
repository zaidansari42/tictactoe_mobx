import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../presentation/components/alert_dialogue.dart';

part 'tictactoe.g.dart';

class Tictac = _Tictac with _$Tictac;

abstract class _Tictac with Store {
  @observable
  ObservableList<String> data = ObservableList.of([
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ]);

  @observable
  bool currentPlayerX = true;

  int timesPLayed = 0;

  @computed
  ObservableList<String> get currentStatus => data;

  @action
  void switchPlayer() {
    currentPlayerX = !currentPlayerX;
    timesPLayed = timesPLayed + 1;
  }

  @action
  void checkForWin(BuildContext context) {
    if (data[0] == data[1] &&
        data[1] == data[2] &&
        data[0] == data[2] &&
        data[0] != '') {
      _showMyDialog(player: data[0], context: context);
    } else if (data[3] == data[4] &&
        data[4] == data[5] &&
        data[3] == data[5] &&
        data[3] != '') {
      _showMyDialog(player: data[3], context: context);
    } else if (data[6] == data[7] &&
        data[7] == data[8] &&
        data[6] == data[8] &&
        data[6] != '') {
      _showMyDialog(player: data[6], context: context);
    } else if (data[0] == data[4] &&
        data[4] == data[8] &&
        data[0] == data[8] &&
        data[0] != '') {
      _showMyDialog(player: data[0], context: context);
    } else if (data[2] == data[4] &&
        data[4] == data[6] &&
        data[2] == data[6] &&
        data[2] != '') {
      _showMyDialog(player: data[2], context: context);
    } else if (data[0] == data[3] &&
        data[3] == data[6] &&
        data[0] == data[6] &&
        data[0] != '') {
      _showMyDialog(player: data[0], context: context);
    } else if (data[1] == data[4] &&
        data[4] == data[7] &&
        data[1] == data[7] &&
        data[1] != '') {
      _showMyDialog(player: data[1], context: context);
    } else if (data[2] == data[5] &&
        data[5] == data[8] &&
        data[2] == data[8] &&
        data[2] != '') {
      _showMyDialog(player: data[2], context: context);
    } else if (timesPLayed >= 8) {
      _showMyDialog(draw: true, context: context);
    }
  }

  @action
  fillin(index) {
    data[index] = currentPlayerX ? 'X' : 'O';
  }

  @action
  Future<void> _showMyDialog(
      {String? player = 'X', bool? draw, required BuildContext context}) async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialogue(
          winner: draw == true ? 'draw' : player!,
          resetFunc: resetGame,
        );
      },
    );
  }

  @action
  void afterClicking(int index, BuildContext context) {
    fillin(index);
    if (timesPLayed >= 4) {
      checkForWin(context);
    }
    switchPlayer();
  }

  @action
  void resetGame() {
    data = ObservableList.of([
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ]);

    currentPlayerX = true;
    timesPLayed = 0;
  }
}
