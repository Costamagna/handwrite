import 'package:flutter_test/flutter_test.dart';
import 'package:note/model/data/Line.dart';
import 'package:note/model/penInfo.dart';

void main() {
  group('toJson', () {
    test('No point', () {
      Line ln = Line(PenInfo.base());
      expect(
        ln.toJson(),
        '{ "pen": ${PenInfo.base().toJson()}, "points": []}',
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
      expect(
        ln.toJson(),
        '{ "pen": ${PenInfo.base().toJson()}, "points": [{"x":"0.0", "y":"0.0"} , {"x":"100.0", "y":"100.0"}]}',
      );
    });
  });
}
