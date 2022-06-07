import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:note/model/data/Document.dart';
import 'package:note/model/data/Line.dart';
import 'package:note/model/data/Paper.dart';
import 'package:note/model/penInfo.dart';
import 'package:note/service/FSservice.dart';

class DataService {
  String testFile = "C:\\Users\\mcost\\OneDrive\\Desktop\\test.json";

  Line _temporary = Line(PenInfo.base());
  final List<Paper> lstPage = [Paper()];

  late final Document document;

  DataService(this.document);
  DataService.newDocument() {
    document = Document.newNow([]);
  }

  void saveOnFile() {
    FSservice.saveFile(testFile,
        '{"pages":[${lstPage.map((e) => e.toJson()).reduce((value, element) => "$value , $element")}]}');
  }

  void fromFile() async {
    String str = (await FSservice.readFile(testFile)).replaceAll("\\", "");

    dynamic data = jsonDecode(str);

    print(Document.newNow([Paper()]).toJson());

    print("testing");
  }

  void createTemporaryLine(PenInfo penInfo, Offset point) {
    _temporary = Line(penInfo.clone());
    addPointToTemporaryLine(point);
  }

  void addPointToTemporaryLine(Offset point) {
    _temporary.addPoint(point);
  }

  void closeTemporaryLine() {
    document.addLine(_temporary);
    //lstPage.elementAt(_currentPage).addLine(_temporary);
    _temporary = Line(PenInfo.base());
  }

  void deleteLine(Offset point) {
    document.removeLine(point);
  }

  void deletePage() {
    document.deletePage();
  }

  void clearAll() {
    _temporary.clear();
    document.clear();
  }

  String toJson() {
    return '{ "pages": [${lstPage.map((Paper paper) => paper.toJson()).reduce((value, element) => "$value , $element")}]}';
  }

  List<Widget> toWidgetList() => document.toWidgetList();

  Line getTemporaryLine() => _temporary;

  int getCurrentPage() => document.getCurrentPage();

  int getMaxPage() => document.getMaxPage();

  void createNewPage() => document.createNewPage();

  void nextPage() => document.nextPage();

  void previousPage() => document.previousPage();

  void goToPage(int pageNum) => document.goToPage(pageNum);
}
