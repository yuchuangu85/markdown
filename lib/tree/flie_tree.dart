import 'dart:io';

import 'package:mx_markdown/tree/expandable_flie.dart';

class FileTree {
  late File root;
  late ExpandableFile _expandableFile;

  FileTree(this.root);

  void loadExpandableFile() {
    _expandableFile = ExpandableFile(root, 0);
  }
}

class Item {
  late final ExpandableFile _file;
  late String name;
  late int level;

  Item(this._file);

  bool isFolder() {
    return _file is Directory;
  }

  void open(){
    _file.toggleExpand();

  }

}
