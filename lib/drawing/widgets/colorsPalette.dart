import 'package:flutter/material.dart';
import 'package:note/drawing/darwingExport.dart';

class ColorsPalette extends StatefulWidget {
  Color selectedColor = Colors.black;
  ColorsPalette({Key? key, this.onSelectionChanged}) : super(key: key);

  final void Function(Color color)? onSelectionChanged;

  @override
  State<ColorsPalette> createState() => _ColorsPaletteState();
}

class _ColorsPaletteState extends State<ColorsPalette> {
  @override
  Widget build(BuildContext context) {
    return Row(
      /* Palette dei colori */
      children: Palette.colors
          .map(
            (color) => GestureDetector(
              child: Container(height: 50, width: 50, color: color),
              onTap: () => widget.onSelectionChanged!(color),
            ),
          )
          .toList(),
    );
  }
}
