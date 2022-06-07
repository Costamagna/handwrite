import 'dart:ui';

import 'package:note/model/Pens/Pen.dart';
import 'package:note/model/penInfo.dart';
import 'package:note/service/dataService.dart';

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
