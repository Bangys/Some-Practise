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