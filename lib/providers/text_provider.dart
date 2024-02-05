import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextProvider extends ChangeNotifier {
  Color _color = Colors.yellow;
  BlendMode _blendMode = BlendMode.color;
  String _text = 'Kushal';

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

  String get text => _text;

  void setText(String texty) async {
    _text = texty;
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("Name", texty);
  }
}
