import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:menubar/menubar.dart';
import 'package:mx_markdown/file_manager/file_manager.dart';


class MenuFile {
  late FileManager fileManager;

  void updateMenuBar() {
    fileManager = FileManager();
    if (Platform.isMacOS || Platform.isLinux) {
      setApplicationMenu([
        Submenu(label: 'File', children: [
          MenuItem(
              label: 'New',
              enabled: true,
              shortcut: LogicalKeySet(
                LogicalKeyboardKey.newKey,
              ),
              onClicked: () {}),
          MenuItem(
              label: 'New Tab',
              enabled: true,
              shortcut: LogicalKeySet(
                LogicalKeyboardKey.meta,
                LogicalKeyboardKey.backspace,
              ),
              onClicked: () {}),
          MenuDivider(),
          MenuItem(
              label: 'Open',
              enabled: true,
              shortcut: LogicalKeySet(
                LogicalKeyboardKey.meta,
                LogicalKeyboardKey.open,
              ),
              onClicked: () {
                fileManager.pickFile();
              }),
          MenuItem(
              label: 'Open Folder',
              enabled: true,
              shortcut: LogicalKeySet(
                LogicalKeyboardKey.open,
              ),
              onClicked: () {
                fileManager.pickDirectory();
              }),
          Submenu(label: 'Open Recents', children: [

          ]),
        ]),
        Submenu(label: 'Counter', children: [
          MenuItem(
              label: 'Reset',
              enabled: true,
              shortcut: LogicalKeySet(
                  LogicalKeyboardKey.meta, LogicalKeyboardKey.digit0),
              onClicked: () {

              }),
          MenuDivider(),// 分割线
        ]),
      ]);
    }
  }
}
