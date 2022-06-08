import 'package:flutter/material.dart';
import 'package:note/drawing/darwingExport.dart';

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

  Map<String, dynamic> toJson() {
    return (_lines.isNotEmpty)
        ? {"lines": _lines.map((Line ln) => ln.toJson()).toList()}
        : {};
  }

  static Paper fromJson(Map<String, dynamic> data) {
    Paper ppr = Paper();
    for (var value
        in (data["lines"] as List).map((e) => Line.fromJson(e)).toList()) {
      ppr.addLine(value);
    }
    return ppr;
  }
}
