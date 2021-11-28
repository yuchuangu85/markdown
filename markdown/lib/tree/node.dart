// 树形目录节点
class Node<T> {
  bool expend; // 是否展开
  int depth; // 深度
  int nodeId; // id
  int fatherId; // 父id
  T object; //
  bool isHasChildren; // 是否有孩子节点
  Node(this.expend, this.depth, this.nodeId, this.fatherId, this.object,
      this.isHasChildren);
}
