import 'dart:io';

class ExpandableFile {
  late FileSystemEntity file;
  late String name;
  late int level;
  late bool canExpand;
  late List<ExpandableFile> children;

  ExpandableFile(this.file, this.level) {
    children = List.empty(growable: true);
  }

  void toggleExpand() {
    if (children.isEmpty) {
      if (file is File) {
        print("file is File");
      } else if (file is Directory) {
        Directory dir = Directory(file.path);
        List<FileSystemEntity> list = dir.listSync();
        children = List.from(list.map((e) => ExpandableFile(e, level + 1)));
      }
    }
  }


}
