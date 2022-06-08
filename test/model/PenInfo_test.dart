import 'package:flutter/material.dart';
import 'package:note/drawing/domain/model/data/penInfo.dart';
import 'package:test/test.dart';

void main() {
  test('from Json', () {
    PenInfo pen = PenInfo.fromJson({"color": "FF000000", "width": "5.0"});
    expect(pen.width == 5 && pen.color == Colors.black, true);
  });
  test('to Json', () {
    expect(
      PenInfo(Colors.black, 5).toJson(),
      {"color": "ff000000", "width": "5.0"},
    );
  });
}
