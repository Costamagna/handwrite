import 'dart:io';

class FSservice {
  static void saveFile(String filename, String data) async {
    await File(filename).writeAsString(data);
  }

  static Future<String> readFile(String filename) async {
    return await File(filename).readAsString();
  }
}
