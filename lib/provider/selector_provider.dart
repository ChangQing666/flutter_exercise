import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  // String name = "Jimi";
  // String phone = "18888888888";
  int score = 18;
  late String name;
  late String phone;
  UserModel({this.name = 'cc', this.phone = '188'});

  void increaseScore() {
    score++;
    notifyListeners();
  }
}
