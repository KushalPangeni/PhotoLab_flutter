import 'package:flutter/material.dart';

class OpacityProvider extends ChangeNotifier {
  double _opacity = 1;

  double get opacity => _opacity;

  void setOpacity(double value) {
    _opacity = value;
    notifyListeners();
  }
}
