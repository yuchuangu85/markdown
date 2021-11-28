import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:menubar/menubar.dart';


class MenuFile {
  void updateMenuBar() {
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
          Submenu(label: 'Open', children: [
            MenuItem(
                label: 'Red',
                enabled: true,
                shortcut: LogicalKeySet(
                  LogicalKeyboardKey.open,
                ),
                onClicked: () {

                }),
          ])
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
