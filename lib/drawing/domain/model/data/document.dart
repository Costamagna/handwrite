import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'line.dart';
import 'paper.dart';

class Document {
  late final DateTime _creationTime;
  final List<Paper> _papers;

  int _currentPage = 0;
  int _maxPage = 0;

  Document(this._creationTime, this._papers);
  Document.newNow(this._papers) {
    _creationTime = DateTime.now();
  }

  void addLine(Line ln) {
    _papers.elementAt(_currentPage).addLine(ln);
  }

  void previousPage() {
    if (_currentPage > 0) _currentPage--;
  }

  void nextPage() {
    if (_currentPage < _maxPage) _currentPage++;
  }

  void createNewPage() {
    _papers.insert(_currentPage, Paper());
    _maxPage++;
  }

  void deletePage() {
    if (_maxPage > 0) {
      _papers.removeAt(_currentPage);
      _maxPage--;
      if (_currentPage > _maxPage) _currentPage = _maxPage;
    } else if (_maxPage == 0) {
      //There is only a page, I'm going to clear this page
      _papers.elementAt(0).clear();
    }
  }

  String getCreationDate() => DateFormat.yMd().add_Hm().format(_creationTime);
  List<Paper> getPapers() => _papers;
  int getCurrentPage() => _currentPage;
  int getMaxPage() => _maxPage;

  Map<String, dynamic> toJson() {
    return {
      "created": getCreationDate(),
      "papers": _papers.map((e) => e.toJson()).toList()
    };
  }

  static Document fromJson(Map data) {
    List<Paper> papers =
        (data["papers"] as List).map((e) => Paper.fromJson(e)).toList();

    return Document(
      DateFormat.yMd().add_Hm().parse(data["created"] as String),
      papers,
    );
  }

  void clear() {
    _papers.elementAt(_currentPage).clear();
  }

  void removeLine(Offset point) {
    _papers.elementAt(_currentPage).remove(point);
  }

  List<Widget> toWidgetList() => _papers.elementAt(_currentPage).toWidgetList();

  void goToPage(int pageNum) {
    if (pageNum >= 0 && pageNum <= _maxPage) {
      _currentPage = pageNum;
    } else {
      throw Exception('');
    }
  }
}
