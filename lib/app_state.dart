import 'package:flutter/material.dart';

// This class holds all the application's state (the variables).
// It extends ChangeNotifier, which allows it to notify other parts of the app
// when its data has changed.
class AppState extends ChangeNotifier {
  // These are your private variables.
  String _playerOne = 'Player 1';
  String _playerTwo = 'Player 2';
  Color _playerOneColour = Color.fromRGBO(255, 0, 0, 0.5);
  Color _playerTwoColour = Color.fromRGBO(255, 255, 0, 0.498);
  bool _isDarkMode = false;
  bool _isPlayerOneTurn = true;
  // ignore: prefer_final_fields
  List<List<Color>> _gamePositions = List<List<Color>>.generate(
    7,
    (_) => List<Color>.generate(6, (_) => Colors.blueGrey),
  );

  // These are public "getters" that allow other parts of the app to read the data.
  String get playerOne => _playerOne;
  String get playerTwo => _playerTwo;
  Color get playerOneColour => _playerOneColour;
  Color get playerTwoColour => _playerTwoColour;
  bool get isDarkMode => _isDarkMode;
  bool get isPlayerOneTurn => _isPlayerOneTurn;
  List<List<Color>> get gamePositions => _gamePositions;

  void setPositionColour(int col, int row, Color colour) {
    _gamePositions[col][row] = colour;
  }

  // This is a method to update the username.
  void updatePlayerOne(String newName) {
    _playerOne = newName;
    notifyListeners();
  }

  // This is a method to update the username.
  void updatePlayerTwo(String newName) {
    _playerTwo = newName;
    notifyListeners();
  }

  // This is a method to toggle the dark mode setting.
  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  // This is a method to toggle the dark mode setting.
  void changeTurn() {
    _isPlayerOneTurn = !_isPlayerOneTurn;
    notifyListeners();
  }
}
