import 'dart:io';

import 'package:file_picker/file_picker.dart';

class FileManager {
  Future<void> pickFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      print("result.size " + result.files.length.toString());
      // List<File> files = result.paths.map((path) => File(path)).toList();
      List<PlatformFile> list = result.files;
      if (list.isNotEmpty) {
        for (PlatformFile file in list) {
          print(file.name + "  " + file.path.toString());
        }
      } else {
        print("list is null");
      }
    } else {
      // User canceled the picker
      print("result is null");
    }
  }

  Future<void> pickDirectory() async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
    print("selectedDirectory is: " + selectedDirectory.toString());
    if (selectedDirectory != null) {
      Directory dir = Directory(selectedDirectory);
      var dirList = dir.list();
      await for (final FileSystemEntity f in dirList) {
        if (f is File) {
          print('Found file ${f.path}');
        } else if (f is Directory) {
          print('Found dir ${f.path}');
        }
      }
    } else {
      // User canceled the picker
      print('User canceled the picker');
    }
  }
}
