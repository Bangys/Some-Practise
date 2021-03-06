# coding: utf-8
from random import randrange


class BaseAlgorithm(object):

    def __init__(self, number, lst=None):
        """
        :param lst: 手动添加序列, 默认为空
        :param number: 要生成的排序元素个数
        """
        self.lst = lst or [randrange(1000) for x in range(number)]
        self.length = len(self.lst)
        print('Before:', self.lst)

    # bubble sort
    # n²
    def bbst(self):
        """
        外层i:每次遍历会完成一个元素的排序，循环次数n-1(n为总元素个数)
        内层j:通过比较两个相邻元素最终得出一个已排序元素,次数随外循环递减
        """
        for i in range(self.length - 1, 0, -1):
            for j in range(i):
                if self.lst[j] > self.lst[j + 1]:
                    self.lst[j], self.lst[j + 1] = self.lst[j + 1], self.lst[j]

    def bbst_improved(self):
        """
        添加标记,如果没有做过交换则说明已有序, 可退出循环
        """
        for i in range(self.length - 1, 0, -1):
            flag = True
            for j in range(i):
                if self.lst[j] > self.lst[j + 1]:
                    self.lst[j], self.lst[j + 1] = self.lst[j + 1], self.lst[j]
                    flag = False
            if flag:
                return

    # selection sort
    # n²
    def slcst(self):
        """
        外层循环n-1次, 每次选出最大的(在内层j中比较)替换
        """
        for i in range(self.length - 1, 0, -1):
            max_num = 0
            for j in range(1, i + 1):
                if self.lst[j] > self.lst[max_num]:
                    max_num = j
            self.lst[i], self.lst[max_num] = self.lst[max_num], self.lst[i]

    # insert sort
    # n²
    def isrtst(self):
        """
        假设第一个元素是单元素的有序序列
        外层i:每遍历一次,有序序列长度+1
        内层while:从有序序列的末尾开始比较，找到插入位置
        """
        for i in range(1, self.length):
            current_val = self.lst[i]
            position = i
            while position > 0 and self.lst[position - 1] > current_val:
                self.lst[position] = self.lst[position - 1]
                position -= 1
            self.lst[position] = current_val

    # shell sort
    # nlog2n
    def shellsort(self):
        """
        插入排序的改进版(也叫缩小增量排序)
        1.把序列按增量分成多个子序列
        2.对子序列进行直接插入排序
        3.依次缩减增量再排序, 生成一个"基本有序"的序列
        4.把"基本有序"的序列进行最后一次插入排序
        """
        gap = self.length // 2
        while gap > 0:
            for sub_position in range(gap):

                # equal to insert sort(add gap)
                for i in range(sub_position + gap, self.length, gap):
                    curval = self.lst[i]
                    sequence = i
                    while sequence >= gap and self.lst[sequence - gap] > curval:
                        self.lst[sequence] = self.lst[sequence - gap]
                        sequence -= gap
                    self.lst[sequence] = curval
            # print("list:", self.lst,"gap:", gap,)
            gap //= 2

    def wiki_shellsort(self):
        """
        维基百科版
        """
        gap = self.length // 2
        while gap > 0:
            for i in range(gap, self.length):
                tmp = self.lst[i]
                j = i
                while j >= gap and self.lst[j - gap] > tmp:
                    self.lst[j] = self.lst[j - gap]
                    j -= gap
                self.lst[j] = tmp
            # print("list:", self.lst,"gap:", gap,)
            gap //= 2


def merge(left, right):
    """
    归并操作:比较
    """
    res = list()
    while left and right:
        res.append(left.pop(0)) if left[0] <= right[0] else res.append(right.pop(0))
    if left:
        res += left
    if right:
        res += right
    return res


def mergesort(lst):
    """
    运用二分法
    """
    if len(lst) <= 1:
        return lst
    mid = len(lst) // 2
    left, right = lst[:mid], lst[mid:]
    left = mergesort(left)
    right = mergesort(right)
    return merge(left, right)


def qs2_partition(lst, first, last):
    pivot = lst[last - 1]
    i = first - 1
    for j in range(first, last):
        if lst[j] < pivot:
            i += 1
            lst[i], lst[j] = lst[j], lst[i]
    if lst[last - 1] < lst[i + 1]:
        lst[i + 1], lst[last - 1] = lst[last - 1], lst[i + 1]
    return i + 1


# 较详细的快排
def quicksort2(lst, first, last):
    if first < last:
        p = qs2_partition(lst, first, last)
        quicksort2(lst, first, p)
        quicksort2(lst, p + 1, last)
    return


# 更简洁的快排
def new_quicksort(list):
    if len(list) < 2:
        return list
    else:
        # 设中点
        midpivot = list[0]
        # 分大小两部分
        less_pivot = [i for i in list[1:] if i <= midpivot]
        bigger_pivot = [i for i in list[1:] if i > midpivot]
        # 递归，最后拼成结果值
        result = new_quicksort(less_pivot) + [midpivot] + new_quicksort(bigger_pivot)
        return result


if __name__ == '__main__':
    algo = BaseAlgorithm(10)
    # algo.bbst()
    # algo.bbst_improved()
    # algo.slcst()
    # algo.isrtst()
    # algo.wiki_shellsort()
    # algo.shellsort()
    # result = mergesort(algo.lst)
    # result = quicksort2(algo.lst, 0, algo.length)
    print(new_quicksort(algo.lst))
    print('After:', algo.lst)
