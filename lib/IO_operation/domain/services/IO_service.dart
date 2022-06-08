import 'dart:convert';
import 'dart:io';

import 'package:note/GenericClass/Utils.dart';
import 'package:note/IO_operation/exportIO_operation.dart';

class IOFileSystem implements IO {
  final String _filename = "C:\\Users\\mcost\\OneDrive\\Desktop\\test.json";
  @override
  Future<Map> read() async {
    String str = (await Utils.readFile(_filename));

    Map data = jsonDecode(str);

    return data;
  }

  @override
  void write(Map data) {
    File(_filename).writeAsString(Utils.mapToString(data), flush: true);
  }
}
