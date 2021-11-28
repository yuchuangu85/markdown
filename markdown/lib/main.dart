import 'dart:io' show Platform;
import 'dart:math' as math;
import 'package:window_size/window_size.dart' as window_size;

import 'package:flutter/material.dart';
import 'package:mx_markdown/home_screen.dart';
import 'package:mx_markdown/main_page_screen.dart';
import 'package:mx_markdown/tree/markdown_tree.dart';

void main() {

  // Try to resize and reposition the window to be half the width and height
  // of its screen, centered horizontally and shifted up from center.
  WidgetsFlutterBinding.ensureInitialized();
  window_size.getWindowInfo().then((window) {
    final screen = window.screen;
    if (screen != null) {
      final screenFrame = screen.visibleFrame;
      final width = math.max((screenFrame.width / 2).roundToDouble(), 800.0);
      final height = math.max((screenFrame.height / 2).roundToDouble(), 600.0);
      final left = ((screenFrame.width - width) / 2).roundToDouble();
      final top = ((screenFrame.height - height) / 3).roundToDouble();
      final frame = Rect.fromLTWH(left, top, width, height);
      window_size.setWindowFrame(frame);
      window_size.setWindowMinSize(Size(0.8 * width, 0.8 * height));
      window_size.setWindowMaxSize(Size(1.5 * width, 1.5 * height));
      window_size
          .setWindowTitle('Flutter Testbed on ${Platform.operatingSystem}');
    }
  });

  runApp(
    MaterialApp(
      title: 'markdown',
      initialRoute: '/',
      home: MarkdownTree(),
    ),
  );
}
