# coding: utf-8
from random import randrange


# 1.1 Fibonacci sequence(递归)
def fib_r(n):
    if n <= 1:
        return n
    return fib_r(n - 1) + fib_r(n - 2)


# 1.2 Fibonacci sequence(迭代)
def fib_iter(a, b, n):
    if n == 0:
        return b
    return fib_iter(a + b, a, n - 1)


def fib_i(n):
    a = 1
    b = 0
    return fib_iter(a, b, n)


# 2.1 Counter(闭包)
def Counter():
    res = []

    def inner():
        res.append(0)
        return len(res)

    return inner


# 2.2 Counter(生成器)
def CounterGenerator():
    n = 1
    while True:
        yield n
        n += 1


cg = CounterGenerator()


def Counter():
    return next(cg)


# producer-consumer model(用协程实现) 
def consumer():
    r = ''
    while True:
        n1 = yield r  # 接收后向下执行
        if not n1:
            return
        print('客：消费%s中...' % n1)
        r = '%s消费完毕' % n1


def produce(c):
    foo = c.send(None)  # 启动生成器
    n = 0
    lst = ['包子', '河流', '矿石', '空气', '土壤']
    while n < len(lst):
        print('老板：%s已生产完毕' % lst[n])
        r1 = c.send(lst[n])  # 把值传到consumer中
        print('客：%s' % r1)
        n += 1
    c.close()


# 合并两个有序列表
def loop_merge_sort(l1, l2):
    tmp = []
    while len(l1) > 0 and len(l2) > 0:
        if l1[0] < l2[0]:
            tmp.append(l1[0])
            del l1[0]
        else:
            tmp.append(l2[0])
            del l2[0]
    tmp.extend(l1)
    tmp.extend(l2)
    return tmp


# 交叉链表求交点 简易方法
# 使用a,b两个list来模拟链表，可以看出交叉点是 7这个节点
def linked_intersection(l1, l2):
    for i in range(1, min(len(l1), len(l2))):
        if i == 1 and (l1[-1] != l2[-1]):
            print("No")
            break
        else:
            if l1[-i] != l2[-i]:
                print("交叉节点：", l1[-i + 1])
                break
            else:
                pass


# 二分查找
def binary_search(lst, item):
    low = 0
    high = len(lst) - 1
    while low <= high:
        mid = (low + high) // 2
        guess = lst[mid]
        if guess > item:
            high = mid - 1
        elif guess < item:
            low = mid + 1
        else:
            return mid
    return None