// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tictactoe.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Tictac on _Tictac, Store {
  Computed<ObservableList<String>>? _$currentStatusComputed;

  @override
  ObservableList<String> get currentStatus => (_$currentStatusComputed ??=
          Computed<ObservableList<String>>(() => super.currentStatus,
              name: '_Tictac.currentStatus'))
      .value;

  late final _$dataAtom = Atom(name: '_Tictac.data', context: context);

  @override
  ObservableList<String> get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(ObservableList<String> value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$currentPlayerXAtom =
      Atom(name: '_Tictac.currentPlayerX', context: context);

  @override
  bool get currentPlayerX {
    _$currentPlayerXAtom.reportRead();
    return super.currentPlayerX;
  }

  @override
  set currentPlayerX(bool value) {
    _$currentPlayerXAtom.reportWrite(value, super.currentPlayerX, () {
      super.currentPlayerX = value;
    });
  }

  late final _$_showMyDialogAsyncAction =
      AsyncAction('_Tictac._showMyDialog', context: context);

  @override
  Future<void> _showMyDialog(String player,
      {bool? draw, required BuildContext context}) {
    return _$_showMyDialogAsyncAction
        .run(() => super._showMyDialog(player, draw: draw, context: context));
  }

  late final _$_TictacActionController =
      ActionController(name: '_Tictac', context: context);

  @override
  void switchPlayer() {
    final _$actionInfo =
        _$_TictacActionController.startAction(name: '_Tictac.switchPlayer');
    try {
      return super.switchPlayer();
    } finally {
      _$_TictacActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkForWin(BuildContext context) {
    final _$actionInfo =
        _$_TictacActionController.startAction(name: '_Tictac.checkForWin');
    try {
      return super.checkForWin(context);
    } finally {
      _$_TictacActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fillin(dynamic index) {
    final _$actionInfo =
        _$_TictacActionController.startAction(name: '_Tictac.fillin');
    try {
      return super.fillin(index);
    } finally {
      _$_TictacActionController.endAction(_$actionInfo);
    }
  }

  @override
  void afterClicking(int index, BuildContext context) {
    final _$actionInfo =
        _$_TictacActionController.startAction(name: '_Tictac.afterClicking');
    try {
      return super.afterClicking(index, context);
    } finally {
      _$_TictacActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetGame() {
    final _$actionInfo =
        _$_TictacActionController.startAction(name: '_Tictac.resetGame');
    try {
      return super.resetGame();
    } finally {
      _$_TictacActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
data: ${data},
currentPlayerX: ${currentPlayerX},
currentStatus: ${currentStatus}
    ''';
  }
}
