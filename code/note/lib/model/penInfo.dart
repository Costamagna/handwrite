import 'package:flutter/material.dart';

class PenInfo {
  Color _color = Colors.black;
  double _width = 2;

  PenInfo.base();
  PenInfo(this._color, this._width);

  Paint getPaint() {
    return Paint()
      ..color = _color
      ..strokeWidth = _width;
  }

  /* --- Getter & Setter */

  Color get color => _color;

  set color(Color value) {
    _color = value;
  }

  double get width => _width;

  set width(double value) {
    _width = value;
  }
  /* --- --- --- */

  PenInfo clone() {
    return PenInfo(_color, _width);
  }
}
