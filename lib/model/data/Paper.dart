import 'package:flutter/material.dart';

import '../../widget/WidgetLine.dart';
import 'Line.dart';

class Paper {
  final List<Line> _lines = [];

  void addLine(Line ln) {
    _lines.add(ln);
  }

  void remove(Offset point) {
    _lines.removeWhere((Line ln) => ln.delete(point));
  }

  void clear() {
    _lines.clear();
  }

  List<Widget> toWidgetList() =>
      _lines.map((Line ln) => WidgetLine(line: ln)).toList();

  String toJson() {
    if (_lines.isEmpty) {
      return '';
    } else {
      return '{ "lines": [${_lines.map((Line ln) => ln.toJson()).fold(
            "",
            (String value, element) =>
                (value.isEmpty) ? element : "$value , $element",
          )}]}';
    }
  }

  static List<Paper> fromJson(List data) {
    print(data);
    return [];
  }
}
