import 'package:flutter/material.dart';
import 'package:note/model/penInfo.dart';
import 'package:note/service/dataService.dart';

abstract class Pen {
  void onPanStart(DataService data, Offset point, PenInfo penInfo);
  void onPanUpdate(DataService data, Offset point);
  void onPanEnd(DataService data);
}
