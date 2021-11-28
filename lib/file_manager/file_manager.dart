import 'package:file_picker/file_picker.dart';

class FileManager {
  Future<void> pickFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
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

    if (selectedDirectory == null) {
      // User canceled the picker
    }
  }
}
