import 'package:flutter/material.dart';
import 'package:note/widget/Drawer/TemporaryDrawer.dart';

import '../model/Line.dart';

class CustomCanvas extends StatefulWidget {
  final Line line;
  const CustomCanvas({Key? key, required this.line}) : super(key: key);

  @override
  State<CustomCanvas> createState() => _CanvasState();
}

class _CanvasState extends State<CustomCanvas> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: CustomPaint(
        painter: TemporaryDrawer(
          widget.line,
        ),
      ),
    );
  }
}
