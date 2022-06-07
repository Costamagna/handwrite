import 'package:flutter/material.dart';

import '../model/data/Line.dart';
import 'Drawer/WidgetDrawer.dart';

class WidgetLine extends StatefulWidget {
  final Line line;
  const WidgetLine({Key? key, required this.line}) : super(key: key);

  @override
  State<WidgetLine> createState() => _WidgetLineState();
}

class _WidgetLineState extends State<WidgetLine> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.line.getTopLeftPoint().dx,
      top: widget.line.getTopLeftPoint().dy,
      height: widget.line.getHeight(),
      width: widget.line.getWidth(),
      child: Container(
        decoration: BoxDecoration(
          border: (widget.line.isSelected())
              ? Border.all(color: Colors.blueAccent, width: 4)
              : null,
        ),
        height: widget.line.getHeight(),
        width: widget.line.getWidth(),
        child: CustomPaint(
          painter: WidgetDrawer(widget.line),
        ),
      ),
    );
  }
}
