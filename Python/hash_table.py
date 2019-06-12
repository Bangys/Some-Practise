class HashTable(object):
    def __init__(self):
        # size 选素数可以得到更为合理的下标分布
        self.table_size = 10007
        # table 是用来存储数据的数组
        self.table = [0] * self.table_size

    # 这个魔法方法是用来实现 in  not in 语法的
    def __contains__(self, item):
        return self.has_key(item)

    def has_key(self, key):
        """
        检查一个 key 是否存在, 时间很短, 是 O(1)
        如果用 list 来存储, 需要遍历, 时间是 O(n)
        """
        index = self._index(key)
        # 取元素
        v = self.table[index]
        if isinstance(v, list):
            # 检查是否包含我们要找的 key
            for kv in v:
                if kv[0] == key:
                    return True
        # 如果得到的是 int 0 说明没找到, 返回 False
        # 如果得到的是 list 但是遍历结果没有我们要找的 key 也是没找到
        return False

    # 在下标处插入元素
    def _insert_at_index(self, index, key, value):
        # 检查下标处是否是第一次插入数据
        v = self.table[index]
        data = [key, value]
        if v == 0:
            # int为0说明是第一次, 那么就插入一个 list 来存
            # 把 key value 作为一个数组存进去是因为会出现相同 hash 值的 key
            # 这时候就需要比较原始信息来找到相应的数据
            self.table[index] = [data]
        else:
            # 如果不是, 会得到list, 直接append
            self.table[index].append(data)

    def add(self, key, value):
        """
        向hashtable 中加入一对元素
        """
        index = self._index(key)
        self._insert_at_index(index, key, value)

    def get(self, key, default_value=None):
        """
        这个和 dict 的 get 函数一样
        """
        index = self._index(key)
        # 取元素
        v = self.table[index]
        if isinstance(v, list):
            # 检查是否包含我们要找的 key
            for kv in v:
                if kv[0] == key:
                    return kv[1]
        # 如果得到的是 int 0 说明没找到, 返回 default_value
        # 如果得到的是 list 但是遍历结果没有我们要找的 key 也是没找到
        return default_value

    # 返回计算后的下标
    def _index(self, key):
        return self._hash(key) % self.table_size

    # 下标计算
    def _hash(self, s):
        # n为hash初始值
        n = 1
        f = 1
        for i in s:
            n += ord(i) * f
            f *= 10
        return n


def test():
    import uuid
    names = [
        'one',
        'two',
        'three',
    ]
    ht = HashTable()
    for key in names:
        value = uuid.uuid4()
        ht.add(key, value)
        print('add:', key, value)
    for key in names:
        v = ht.get(key)
        print('get:', key, v)


if __name__ == '__main__':
    test()
