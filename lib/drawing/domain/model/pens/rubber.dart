import 'dart:ui';

import 'package:note/drawing/darwingExport.dart';

class Rubber implements Pen {
  @override
  void onPanStart(DataService data, Offset point, PenInfo penInfo) {
    data.deleteLine(point);
  }

  @override
  void onPanUpdate(DataService data, Offset point) {
    data.deleteLine(point);
  }

  @override
  void onPanEnd(DataService data) {}
}
