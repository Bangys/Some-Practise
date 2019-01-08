# coding: utf-8
from random import randrange


# 1.1 Fibonacci sequence(递归)
def fib_r(n):
    if n <= 1:
        return n
    return fib_r(n-1) + fib_r(n-2)


# 1.2 Fibonacci sequence(迭代)
def fib_iter(a, b, n):
    if n == 0:
        return b
    return fib_iter(a+b, a, n-1)

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
        n1 = yield r # 接收后向下执行
        if not n1:
            return
        print('客：消费%s中...' % n1) 
        r = '%s消费完毕' % n1

def produce(c):
    foo = c.send(None) # 启动生成器 
    n = 0
    lst = ['包子', '河流', '矿石', '空气', '土壤']
    while n < len(lst):
        print('老板：%s已生产完毕' % lst[n])
        r1 = c.send(lst[n]) # 把值传到consumer中
        print('客：%s' % r1)
        n+=1
    c.close()