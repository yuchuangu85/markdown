import 'package:flutter/material.dart';
import 'package:mx_markdown/home_screen.dart';
import 'package:mx_markdown/main_page_screen.dart';
import 'package:mx_markdown/tree/markdown_tree.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'markdown',
      initialRoute: '/',
      home: MarkdownTree(),
    ),
  );
}
