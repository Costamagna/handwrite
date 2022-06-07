import 'package:note/model/data/Document.dart';
import 'package:note/service/dataService.dart';
import 'package:test/test.dart';

void main() {
  group('Check iniziale - Document with no papers', () {
    test('CurrentPage is 0', () {
      DataService data = DataService(Document.newNow([]));
      expect(data.getCurrentPage(), 0);
    });

    test('MaxPage is 0', () {
      DataService data = DataService(Document.newNow([]));
      expect(data.getMaxPage(), 0);
    });

    test('WidgetList.length is 0', () {
      DataService data = DataService(Document.newNow([]));
      expect(data.toWidgetList().length, 0);
    });
  });
  group('Check page system', () {
    group('Insert new page', () {
      test('no position check', () {
        DataService data = DataService(Document.newNow([]));
        data.createNewPage();
        expect(data.getMaxPage(), 1);
      });

      test('Position check', () {
        DataService data = DataService(Document.newNow([]));
        data.createNewPage();
        expect(data.getMaxPage() == 1 && data.getCurrentPage() == 0, true);
      });
    });
    group('Preview page', () {
      test('current_page is 0', () {
        DataService data = DataService(Document.newNow([]));
        data.createNewPage();
        data.previousPage();
        expect(data.getCurrentPage(), 0);
      });
      test('current_page is greater then 0', () {
        DataService data = DataService(Document.newNow([]));
        data.createNewPage();
        data.goToPage(1);
        data.previousPage();
        expect(data.getCurrentPage(), 0);
      });
    });
    group('Next page', () {
      test('current_page is 0', () {
        DataService data = DataService(Document.newNow([]));
        data.createNewPage();
        data.nextPage();
        expect(data.getCurrentPage(), 1);
      });
      test('current_page is equal to max_page', () {
        DataService data = DataService(Document.newNow([]));
        data.createNewPage();
        data.nextPage();
        expect(data.getCurrentPage(), 1);
      });
    });
    group('Go to page', () {
      test('max_page is 0', () {
        DataService data = DataService(Document.newNow([]));
        data.goToPage(0);
        expect(data.getCurrentPage(), 0);
      });
      test('max_page is greater then 0', () {
        DataService data = DataService(Document.newNow([]));
        data.createNewPage();
        data.createNewPage();
        data.goToPage(1);
        expect(data.getCurrentPage(), 1);
      });
    });
    group('Delete page', () {
      test('max_page is 0)', () {
        DataService data = DataService(Document.newNow([]));
        data.deletePage();
        expect(data.getMaxPage(), 0);
      });
      test('max_page is 0 - check if page has been cleared', () {
        DataService data = DataService(Document.newNow([]));
        data.deletePage();
        expect(data.toWidgetList().length, 0);
      });
      test('max_page is greater then 0', () {
        DataService data = DataService(Document.newNow([]));
        data.createNewPage();
        data.deletePage();
        expect(data.getMaxPage(), 0);
      });
    });
  });
}
