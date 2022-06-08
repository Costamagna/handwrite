import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note/drawing/darwingExport.dart';

void main() {
  group('toJson', () {
    test('No point', () {
      Line ln = Line(PenInfo.base());
      expect(
        ln.toJson(),
        {"pen": PenInfo.base().toJson(), "points": []},
      );
    });
    test('With points', () {
      Line ln = Line(PenInfo.base());
      ln.addPoint(const Offset(0, 0));
      ln.addPoint(const Offset(100, 100));

      /**
     * NB: viene utilizzata PenInfo.base().toJson() perché verificata in altri unit-test
     *      quindi per semplicità di scrittura e compatibilità viene invocata.
     */
      dynamic t = ln.toJson();
      expect(
        ln.toJson(),
        {
          "pen": PenInfo.base().toJson(),
          "points": [
            {"x": "0.0", "y": "0.0"},
            {"x": "100.0", "y": "100.0"}
          ]
        },
      );
    });
  });

  group('fromJson', () {
    test('no point', () {
      Line ln = Line.fromJson({"pen": fakePenInfo_Json(), "points": []});

      expect(ln.getLine(), []);
    });
    test('One point', () {
      Line ln = Line.fromJson({
        "pen": fakePenInfo_Json(),
        "points": [
          {"x": "100.0", "y": "100.0"}
        ]
      });

      expect(ln.getLine(), [const Offset(100, 100)]);
    });
    test('Two point', () {
      Line ln = Line.fromJson({
        "pen": fakePenInfo_Json(),
        "points": [
          {"x": "20.0", "y": "20.0"},
          {"x": "100.0", "y": "100.0"}
        ]
      });

      expect(ln.getLine(), [const Offset(20, 20), const Offset(100, 100)]);
    });
  });
}

Map<String, dynamic> fakePenInfo_Json() {
  return PenInfo(Colors.black, 2).toJson();
}
