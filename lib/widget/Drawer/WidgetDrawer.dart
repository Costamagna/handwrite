import 'dart:ui';

import 'package:flutter/material.dart';

import '../../model/data/Line.dart';

class WidgetDrawer extends CustomPainter {
  final Line line;

  WidgetDrawer(this.line);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPoints(
        PointMode.polygon, line.getLineCleared(), line.getPaint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
