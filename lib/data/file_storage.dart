import 'package:path_provider/path_provider.dart';
import 'dart:io';

class FileStorage {
  static Future<String> _getCurrentPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> getFile(String filename) async {
    final directory = await _getCurrentPath();
    return File('$directory/$filename');
  }

  static Future<void> saveFile(String filename, String content) async {
    final file = await getFile(filename);
    await file.writeAsString(content);
  }
}
