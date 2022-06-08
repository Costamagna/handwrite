import 'package:flutter/material.dart';
import 'package:note/IO_operation/domain/repository/IO_repository.dart';
import 'package:note/drawing/darwingExport.dart';

class DataService {
  final IO ioRepo;

  Line _temporary = Line(PenInfo.base());
  final List<Paper> lstPage = [Paper()];

  late Document document;

  DataService(this.document, this.ioRepo);
  DataService.newDocument(this.ioRepo) {
    document = Document.newNow([Paper()]);
  }

  void saveOnFile() {
    ioRepo.write(document.toJson());
  }

  void fromFile() async {
    document = Document.fromJson(await ioRepo.read());
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

  Map<String, dynamic> toJson() {
    return {
      "pages": lstPage.map((Paper paper) => paper.toJson()).toList(),
    };
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
