import 'dart:ui';

import 'package:note/model/penInfo.dart';

class Line {
  final List<Offset> _points = [];
  final PenInfo _penInfo;
  bool _selected = false;

  Offset topLeftPoint = const Offset(double.maxFinite, double.maxFinite);
  Offset bottomRightPoint =
      const Offset(double.negativeInfinity, double.negativeInfinity);

  Line(this._penInfo);

  void addPoint(Offset point) {
    // calc top-left point
    if (point.dx < topLeftPoint.dx) {
      topLeftPoint = Offset(point.dx, topLeftPoint.dy);
    }
    if (point.dy < topLeftPoint.dy) {
      topLeftPoint = Offset(topLeftPoint.dx, point.dy);
    }

    // calc bottom-right point
    if (point.dx > bottomRightPoint.dx) {
      bottomRightPoint = Offset(point.dx, bottomRightPoint.dy);
    }
    if (point.dy > bottomRightPoint.dy) {
      bottomRightPoint = Offset(bottomRightPoint.dx, point.dy);
    }

    _points.add(point);
  }

  void select() => _selected = true;
  void toggleSelection() => _selected = !_selected;
  bool isSelected() => _selected;

  List<Offset> getLine() => _points;

  Offset getTopLeftPoint() => topLeftPoint;

  Offset getBottomRightPoint() => bottomRightPoint;

  double getHeight() => bottomRightPoint.dy - topLeftPoint.dy;

  double getWidth() => bottomRightPoint.dx - topLeftPoint.dx;

  Paint getPaint() => _penInfo.getPaint();

  void clear() => _points.clear();

  int getPoints() => _points.length;

  bool delete(Offset point) {
    /**
     * Must be improved
     */
    if (bottomRightPoint.dx >= point.dx && point.dx >= topLeftPoint.dx) {
      if (bottomRightPoint.dy >= point.dy && point.dy >= topLeftPoint.dy) {
        return true;
      }
    }
    return false;
  }

  List<Offset> getLineCleared() {
    return _points
        .map((e) => e.translate(-topLeftPoint.dx, -topLeftPoint.dy))
        .toList();
  }
}
