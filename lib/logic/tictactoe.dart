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

  @action
  bool checkifAlreadyFilled(index) {
    return (data[index] == 'X' || data[index] == 'O');
  }

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
      _showMyDialog(data[0], draw: false, context: context);
    } else if (data[3] == data[4] &&
        data[4] == data[5] &&
        data[3] == data[5] &&
        data[3] != '') {
      _showMyDialog(data[3], draw: false, context: context);
    } else if (data[6] == data[7] &&
        data[7] == data[8] &&
        data[6] == data[8] &&
        data[6] != '') {
      _showMyDialog(data[6], draw: false, context: context);
    } else if (data[0] == data[4] &&
        data[4] == data[8] &&
        data[0] == data[8] &&
        data[0] != '') {
      _showMyDialog(data[0], draw: false, context: context);
    } else if (data[2] == data[4] &&
        data[4] == data[6] &&
        data[2] == data[6] &&
        data[2] != '') {
      _showMyDialog(data[2], draw: false, context: context);
    } else if (data[0] == data[3] &&
        data[3] == data[6] &&
        data[0] == data[6] &&
        data[0] != '') {
      _showMyDialog(data[0], draw: false, context: context);
    } else if (data[1] == data[4] &&
        data[4] == data[7] &&
        data[1] == data[7] &&
        data[1] != '') {
      _showMyDialog(data[1], draw: false, context: context);
    } else if (data[2] == data[5] &&
        data[5] == data[8] &&
        data[2] == data[8] &&
        data[2] != '') {
      _showMyDialog(data[2], draw: false, context: context);
    } else if (timesPLayed >= 8) {
      _showMyDialog('O', draw: true, context: context);
    }
  }

  @computed
  List<String> get dataDisplay => data;

  @action
  fillin(index) {
    data[index] = currentPlayerX ? 'X' : 'O';
  }

  @action
  Future<void> _showMyDialog(String player,
      {required bool draw, required BuildContext context}) async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialogue(
          winner: draw == true ? 'draw' : player,
          func: resetGame,
        );
      },
    );
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
