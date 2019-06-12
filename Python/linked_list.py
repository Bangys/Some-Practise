# 节点
class Node(object):
    def __init__(self, x=None):
        self.val = x
        self.next = None

    def is_empty(self):
        return self.next is None

    def length(self):
        index = 0
        node = self.next
        while node is not None:
            index += 1
            node = node.next
        return index

    def find(self, val):
        node = self.next
        while node is not None:
            if node.val == val:
                break
            node = node.next
        return node

    def _node_at_index(self, index):
        i = 0
        node = self
        while node is not None:
            if i == index:
                return node
            node = node.next
            i += 1
        return None

    def element_at_index(self, index):
        node = self._node_at_index(index)
        return node.element

    # 栈可用append+pop实现，队列用prepend+pop
    def append(self, node):
        n = self
        while n.next is not None:
            # 确保n是最后一个元素
            n = n.next
        n.next = node
        return

    def prepend(self, node):
        # 找到head 把node赋给head.next
        pass

    def pop(self):
        tail = self
        if tail.next is None:
            tail.val = None
            return self.val

        while tail.next is not None:
            # tail为链表最后一个元素
            tail = tail.next
        before_tail = self
        while before_tail.next is not tail:
            before_tail = before_tail.next

        # 找到tail前一个元素并把next指为None
        before_tail.next = None
        return tail.val

    # 打印链表： "head > node1 > node2 ..."
    def show(self):
        node = self
        s = ''
        while node is not None:
            if node.next is None:
                s += str(node.val)
            else:
                s += str(node.val) + ' > '
            node = node.next
        print(s)

    @staticmethod
    def reverseList(pHead):
        if not pHead or not pHead.next:
            return pHead
        last = None  # 指向上一个节点
        while pHead:
            # 先用tmp保存pHead的下一个节点的信息，
            # 保证单链表不会因为失去pHead节点的next而就此断裂
            tmp = pHead.next
            # 保存完next，就可以让pHead的next指向last了
            pHead.next = last
            # 让last，pHead依次向后移动一个节点，继续下一次的指针反转
            last = pHead
            pHead = tmp
        return last


def test():
    head = Node('head')
    n1 = Node('111')
    n2 = Node('222')
    n1.next = n2
    head.next = n1
    head.show()
    # head > 111 > 222

    n3 = Node('333')
    head.append(n3)
    head.show()
    # head > 111 > 222 > 333

    print(head.reverseList(head).show())
    # 333 > 222 > 111 > head


if __name__ == '__main__':
    test()
    pass
