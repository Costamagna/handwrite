import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Line.dart';
import 'Paper.dart';

class Document {
  late final DateTime _creationTime;
  final List<Paper> _papers;

  int _currentPage = 0;
  int _maxPage = 0;
  final List<Paper> lstPage = [Paper()];

  Document(this._creationTime, this._papers);
  Document.newNow(this._papers) {
    _creationTime = DateTime.now();
  }

  void addLine(Line ln) {
    lstPage.elementAt(_currentPage).addLine(ln);
  }

  void previousPage() {
    if (_currentPage > 0) _currentPage--;
  }

  void nextPage() {
    if (_currentPage < _maxPage) _currentPage++;
  }

  void createNewPage() {
    lstPage.insert(_currentPage, Paper());
    _maxPage++;
  }

  void deletePage() {
    if (_maxPage > 0) {
      lstPage.removeAt(_currentPage);
      _maxPage--;
      if (_currentPage > _maxPage) _currentPage = _maxPage;
    } else if (_maxPage == 0) {
      //There is only a page, I'm going to clear this page
      lstPage.elementAt(0).clear();
    }
  }

  String getCreationDate() => DateFormat.yMd().add_Hm().format(_creationTime);
  List<Paper> getPapers() => _papers;
  int getCurrentPage() => _currentPage;
  int getMaxPage() => _maxPage;

  String toJson() {
    return '{"created": "${getCreationDate()}", "papers": [${_papers.map((e) => e.toJson()).fold(
          "",
          (String value, element) =>
              (value.isEmpty) ? element : "$value , $element",
        )}]}';
  }

  static Document fromJson(dynamic data) {
    return Document(DateFormat.yMd().add_Hm().parse(data["created"] as String),
        Paper.fromJson(data["papers"]));
  }

  void clear() {
    lstPage.elementAt(_currentPage).clear();
  }

  void removeLine(Offset point) {
    lstPage.elementAt(_currentPage).remove(point);
  }

  List<Widget> toWidgetList() => lstPage.elementAt(_currentPage).toWidgetList();

  void goToPage(int pageNum) {
    if (pageNum >= 0 && pageNum <= _maxPage) {
      _currentPage = pageNum;
    } else {
      throw Exception('');
    }
  }
}
