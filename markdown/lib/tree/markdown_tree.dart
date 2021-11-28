import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mx_markdown/file_manager/file_manager.dart';
import 'package:mx_markdown/menubar/menu_file.dart';

import 'node.dart';

// https://blog.csdn.net/u013425527/article/details/100174999

class MarkdownTree extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MarkdownTreeState();
  }
}

class MarkdownTreeState extends State<MarkdownTree> {
  // 保存所有的数据
  List<Node> allDataList = List.empty(growable: true);
  List<Node> expandList = List.empty(growable: true);
  List<int> markList = List.empty(growable: true);

  @override
  void initState() {
    buildNode();
  }

  void configMenuBar() {
    MenuFile menuFile = MenuFile();
    menuFile.updateMenuBar();
  }

  @override
  Widget build(BuildContext context) {
    configMenuBar();
    return Scaffold(
      appBar: AppBar(
        title: const Text('tree'),
      ),
      body: Column(
        children: _buildNode(expandList),
      ),
    );
  }

  List<Widget> _buildNode(List<Node> nodes) {
    List<Widget> widgets = List.empty(growable: true);
    if (nodes.isNotEmpty) {
      for (Node node in nodes) {
        widgets.add(GestureDetector(
          child: ImageText(10.0 * node.depth, node.object.toString(),
              node.expend, node.isHasChildren),
          onTap: () {
            FileManager fileManager = FileManager();
            fileManager.openFile();
            if (node.isHasChildren) {
              if (node.expend) {
                // 之前扩展状态，收起列表
                _collect(node.nodeId);
              } else {
                // 之前是收起状态，展开列表
                node.expend = true;
                _expand(node.nodeId);
              }
              setState(() {});
            }
          },
        ));
      }
    }
    return widgets;
  }

  void buildNode() {
    Node<String> node = new Node(false, 1, 1, 0, "tree", true);

    Node<String> node1 = new Node(false, 1, 2, 0, "tree1", false);
    Node<String> node2 = new Node(false, 1, 3, 0, "tree2", false);
    Node<String> node3 = new Node(false, 1, 4, 0, "tree3", false);
    Node<String> node4 = new Node(false, 1, 5, 0, "tree4", false);

    Node<String> node5 = new Node(false, 3, 6, 1, "tree5", true);
    Node<String> node6 = new Node(false, 6, 6, 5, "tree6", false);

    expandList.add(node);
    expandList.add(node1);
    expandList.add(node2);
    expandList.add(node3);

    allDataList.add(node);
    allDataList.add(node1);
    allDataList.add(node2);
    allDataList.add(node3);
    allDataList.add(node4);
    allDataList.add(node5);
    allDataList.add(node6);

    print('创建数据：' + expandList.length.toString());
  }

  int nodeId = 1;

  // 展开树， nodeId是要展开的Node的id
  // 作法是遍历整个list，将直接挂在这个节点下面节点增加到一个临时列表
  void _expand(int nodeId) {
    // 保存临时列表
    List<Node> tmp = List.empty(growable: true);
    for (Node node in allDataList) {
      if (node.fatherId == nodeId) {
        tmp.add(node);
      }
    }
    // 找到插入点
    int index = -1;
    int length = expandList.length;
    for (int i = 0; i < length; i++) {
      if (nodeId == expandList[i].nodeId) {
        index = i + 1;
        break;
      }
    }
    // 插入
    expandList.insertAll(index, tmp);
  }

  // 收起树：id代表被点击的对象
  // 作法是遍历整个expand列表，将直接和间接挂在该对象下面的节点标记
  // 将这些被标记的节点删除即可，此处用到的是将没有被标记的节点加入到新的列表中
  void _collect(int nodeId) {
    // 在清除之前标记
    markList.clear();
    // 标记
    _mark(nodeId);
    // 重新对expandList赋值
    List<Node> tmp = List.empty(growable: true);
    for (Node node in expandList) {
      if (!markList.contains(node.nodeId)) {
        tmp.add(node);
      } else {
        node.expend = false;
      }
    }
    expandList.clear();
    expandList.addAll(tmp);
    setState(() {});
  }

  void _mark(int nodeId) {
    for (Node node in expandList) {
      if (nodeId == node.fatherId) {
        if (node.isHasChildren) {
          _mark(node.nodeId);
        }
        markList.add(node.nodeId);
      }
    }
  }
}

class ImageText extends StatelessWidget {
  double margin = 0;
  String str = '';
  bool isExpand = false;
  bool isHasChildren = false;

  ImageText(this.margin, this.str, this.isExpand, this.isHasChildren) {
    this.margin = margin;
    this.str = str;
    this.isExpand = isExpand;
    this.isHasChildren = isHasChildren;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        decoration: const BoxDecoration(color: Colors.greenAccent),
        width: double.infinity,
        height: 40,
        margin: EdgeInsets.only(left: margin),
        child: Row(
          children: <Widget>[
            Visibility(
              visible: isHasChildren,
              child: Image.asset(isExpand
                  ? 'assets/images/arrow_down.png'
                  : 'assets/images/arrow_right.png'),
            ),
            Text(
              str,
              style: const TextStyle(
                fontSize: 17,
              ),
            ),
          ],
        ));
  }
}
