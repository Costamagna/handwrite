import 'package:flutter/material.dart';
import 'package:note/IO_operation/domain/services/IO_service.dart';
import 'package:note/drawing/darwingExport.dart';

class DrawingPage extends StatefulWidget {
  final DataService dataService = DataService.newDocument(IOFileSystem());
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
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.pen = Rubber();
                    });
                  },
                  child: const Icon(Icons.delete)),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.pen = Pencil();
                    });
                  },
                  child: const Icon(Icons.edit)),
              const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.dataService.previousPage();
                    });
                  },
                  child: const Icon(Icons.arrow_back)),
              Text(
                  "${widget.dataService.getCurrentPage() + 1} / ${widget.dataService.getMaxPage() + 1}"),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.dataService.nextPage();
                    });
                  },
                  child: const Icon(Icons.arrow_forward)),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.dataService.createNewPage();
                  });
                },
                child: const Icon(Icons.fiber_new),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.dataService.deletePage();
                  });
                },
                child: const Icon(Icons.delete_forever_outlined),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.dataService.saveOnFile();
                  });
                },
                child: const Icon(Icons.save),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.dataService.fromFile();
                  });
                },
                child: const Icon(Icons.file_open),
              ),
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
