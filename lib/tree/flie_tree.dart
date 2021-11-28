import 'dart:io';

import 'package:mx_markdown/tree/expandable_flie.dart';

class FileTree {
  late File root;
  late ExpandableFile _expandableFile;

  FileTree(this.root);

  void loadExpandableFile() {
    _expandableFile = ExpandableFile(root, 0);
  }

  // 将树转化为List
  List<Item> getList() {
    List<Item> list = List.empty(growable: true);
    list.add(
        Item(_expandableFile, _expandableFile.name, _expandableFile.level));
    for (ExpandableFile file in _expandableFile.children) {
      list.add(Item(file, file.name, file.level));
    }
    return list;
  }
}

class Item {
  late final ExpandableFile _file;
  late String name;
  late int level;

  Item(this._file, this.name, this.level);

  bool isFolder() {
    return _file is Directory;
  }

  void open() {
    _file.toggleExpand();
    // TOOD 刷新UI传入新的File
    //editors.open(_file.file);
  }
}
