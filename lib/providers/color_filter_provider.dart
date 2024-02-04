import 'package:flutter/material.dart';

class ColorFilterProvider extends ChangeNotifier {
  Color _color = Colors.transparent;
  BlendMode _blendMode = BlendMode.color;
  // ColorFilter colorFilter = const ColorFilter.mode(Colors.black, BlendMode.color);
  bool _srgbToLinearGammaCheck = false;

  Color get color => _color;

  void setColors(Color color) {
    _color = color;
    notifyListeners();
  }

  BlendMode get blendmode => _blendMode;

  void setBlendMode(BlendMode mode) {
    _blendMode = mode;
    notifyListeners();
  }

  bool get srgbToLinearGammaCheck => _srgbToLinearGammaCheck;
  void srgbCheck(bool check) {
    _srgbToLinearGammaCheck = check;
    notifyListeners();
  }
}
