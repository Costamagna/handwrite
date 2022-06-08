import 'package:flutter/material.dart';
import 'package:note/drawing/domain/model/data/penInfo.dart';
import 'package:note/drawing/domain/services/dataService.dart';

abstract class Pen {
  void onPanStart(DataService data, Offset point, PenInfo penInfo);
  void onPanUpdate(DataService data, Offset point);
  void onPanEnd(DataService data);
}
