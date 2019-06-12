class Tree(object):
    def __init__(self, element=None):
        self.element = element
        self.left = None
        self.right = None

    # 遍历
    def traversal(self):
        """
        前序遍历：中左右
        中序遍历：左中右
        后序遍历：左右中
        """
        print(self.element)
        if self.left is not None:
            self.left.traversal()
        if self.right is not None:
            self.right.traversal()

    # 翻转
    def reverse(self):
        self.left, self.right = self.right, self.left
        if self.left is not None:
            self.left.reverse()
        if self.right is not None:
            self.right.reverse()


def test():
    t = Tree(0)
    left = Tree(1)
    right = Tree(2)
    cl = Tree(11)
    cr = Tree(22)
    t.left = left
    t.right = right
    t.left.left = cl
    t.right.right = cr
    # 遍历
    t.traversal()
    print('--' * 10)
    # 翻转
    t.reverse()
    t.traversal()


if __name__ == '__main__':
    test()
    pass
