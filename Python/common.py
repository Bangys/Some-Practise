# coding: utf-8
from random import randrange


# recursion
def fib_r(n):
    if n <= 1:
        return n
    return fib_r(n-1) + fib_r(n-2)

# iteration
def fib_iter(a, b, n):
    if n == 0:
        return b
    return fib_iter(a+b, a, n-1)

def fib_i(n):
    a = 1
    b = 0
    return fib_iter(a, b, n)

if __name__ == '__main__':
    test1 = [fib_r(i) for i in range(1, 11)]
    test2 = [fib_i(i) for i in range(1, 11)]
    print(test1)
    print(test2)
