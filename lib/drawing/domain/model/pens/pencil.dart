import 'dart:ui';

import 'package:note/drawing/darwingExport.dart';

class Pencil implements Pen {
  @override
  void onPanStart(DataService data, Offset point, PenInfo penInfo) {
    data.createTemporaryLine(penInfo, point);
  }

  @override
  void onPanUpdate(DataService data, Offset point) {
    data.addPointToTemporaryLine(point);
  }

  @override
  void onPanEnd(DataService data) {
    data.closeTemporaryLine();
  }
}
