import 'package:flutter/material.dart' show ChangeNotifier;

class SelectedItemDrawer extends ChangeNotifier {
  int currentIndex = 0;

  void changeSelectedIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
