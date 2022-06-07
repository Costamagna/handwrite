import 'package:note/model/data/Document.dart';
import 'package:note/model/data/Paper.dart';
import 'package:test/test.dart';

void main() {
  group('Property', () {
    test('No paper', () {
      Document doc = Document.newNow([]);
      expect(doc.getPapers().length, 0);
    });
    test('One paper', () {
      Document doc = Document.newNow([Paper()]);
      expect(doc.getPapers().length, 1);
    });
  });

  group('toJson', () {
    test('No paper', () {
      Document doc = Document(DateTime(2022, 1, 1), []);
      expect(doc.toJson(),
          '{"created": "${doc.getCreationDate()}", "papers": []}');
    });

    test('One paper', () {
      Paper ppr = Paper();
      Document doc = Document(DateTime(2022, 1, 1), [ppr]);
      expect(doc.toJson(),
          '{"created": "${doc.getCreationDate()}", "papers": [${ppr.toJson()}]}');
    });
  });
}
