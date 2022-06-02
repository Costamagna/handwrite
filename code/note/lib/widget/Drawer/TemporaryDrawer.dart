import 'dart:ui';

import 'package:flutter/material.dart';

import '../../model/Line.dart';

class TemporaryDrawer extends CustomPainter {
  final Line line;

  TemporaryDrawer(this.line);

  @override
  Future<void> paint(Canvas canvas, Size size) async {
    canvas.drawPoints(PointMode.polygon, line.getLine(), line.getPaint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
