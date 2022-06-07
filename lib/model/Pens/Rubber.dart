import 'dart:ui';

import 'package:note/model/Pens/Pen.dart';
import 'package:note/model/penInfo.dart';
import 'package:note/service/dataService.dart';

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
