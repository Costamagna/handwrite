//import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:note/model/Line.dart';
import 'package:note/model/penInfo.dart';

import '../widget/WidgetLine.dart';

class DataService {
  Line _temporary = Line(PenInfo.base());
  final List<Line> lstLine = [];

  void createTemporaryLine(PenInfo penInfo, Offset point) {
    _temporary = Line(penInfo.clone());
    addPointToTemporaryLine(point);
  }

  void addPointToTemporaryLine(Offset point) {
    _temporary.addPoint(point);
  }

  void closeTemporaryLine() {
    lstLine.add(_temporary);
    _temporary = Line(PenInfo.base());
  }

  void deleteLine(Offset point) {
    lstLine.removeWhere((Line ln) => ln.delete(point));
  }

  List<Widget> toWidgetList() =>
      lstLine.map((ln) => WidgetLine(line: ln)).toList();

  void clearAll() {
    _temporary.clear();
    lstLine.clear();
  }

  Line getTemporaryLine() => _temporary;
}
