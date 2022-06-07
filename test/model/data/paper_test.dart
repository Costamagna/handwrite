import 'dart:ui';

import 'package:note/model/data/Line.dart';
import 'package:note/model/data/Paper.dart';
import 'package:note/model/penInfo.dart';
import 'package:test/test.dart';

void main() {
  group('toJson', () {
    test('No line', () {
      Paper ppr = Paper();
      expect(ppr.toJson(), '');
    });
    test('One line', () {
      Paper ppr = Paper();
      Line ln = Line(PenInfo.base());
      ln.addPoint(const Offset(100, 100));
      ppr.addLine(ln);

      expect(ppr.toJson(), '{ "lines": [${ln.toJson()}]}');
    });
    test('Two line', () {
      Paper ppr = Paper();
      Line ln1 = Line(PenInfo.base());
      ln1.addPoint(const Offset(100, 100));
      Line ln2 = Line(PenInfo.base());
      ln2.addPoint(const Offset(20, 20));

      ppr.addLine(ln1);
      ppr.addLine(ln2);

      expect(ppr.toJson(), '{ "lines": [${ln1.toJson()} , ${ln2.toJson()}]}');
    });
  });
}
