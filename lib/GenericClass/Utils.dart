import 'dart:convert';
import 'dart:io';

class Utils {
  static String mapToString(Map map) => jsonEncode(map);

  static void saveFile(String filename, String data) async {
    await File(filename).writeAsString(data);
  }

  static Future<String> readFile(String filename) async {
    return await File(filename).readAsString();
  }
}
