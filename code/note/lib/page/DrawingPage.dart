import 'package:flutter/material.dart';
import 'package:note/model/Pens/Pencil.dart';
import 'package:note/model/Pens/Rubber.dart';

import '../model/Pens/Pen.dart';
import '../model/penInfo.dart';
import '../service/dataService.dart';
import '../widget/ColorsPalette.dart';
import '../widget/CustomCanvas.dart';

class DrawingPage extends StatefulWidget {
  final DataService dataService = DataService();
  PenInfo penInfo = PenInfo.base();

  Pen pen = Pencil();

  DrawingPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DrawingPageState();
}

class DrawingPageState extends State<DrawingPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Create a new line
      onPanStart: (DragStartDetails details) {
        final box = context.findRenderObject() as RenderBox;
        final point = box.globalToLocal(details.globalPosition);

        setState(() {
          widget.pen.onPanStart(widget.dataService, point, widget.penInfo);
        });
      },
      // Add points to the line
      onPanUpdate: (DragUpdateDetails details) {
        final box = context.findRenderObject() as RenderBox;
        final point = box.globalToLocal(details.globalPosition);

        setState(() {
          widget.pen.onPanUpdate(widget.dataService, point);
        });
      },
      // Create new groupLine and add the line
      onPanEnd: (DragEndDetails details) {
        // The user has finished drawing the line
        setState(() {
          widget.pen.onPanEnd(widget.dataService);
        });
      },
      child: Stack(
        children: [
          CustomCanvas(line: widget.dataService.getTemporaryLine()),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.dataService.clearAll();
                    });
                  },
                  child: const Icon(Icons.delete_forever)),
              ElevatedButton(onPressed: () {
                setState((){
                  widget.pen = Rubber();
                });
              }, child: const Icon(Icons.delete)),
              ElevatedButton(onPressed: (){
                setState((){
                  widget.pen = Pencil();
                });
              }, child: const Icon(Icons.edit)),
              const Spacer(),
              ColorsPalette(
                onSelectionChanged: (Color color) {
                  setState(() {
                    widget.penInfo.color = color;
                  });
                },
              ),
            ],
          ),
          Stack(
            children: widget.dataService.toWidgetList(),
          ),
        ],
      ),
    );
  }
}
