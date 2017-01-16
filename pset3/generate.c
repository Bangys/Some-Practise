/**
 * generate.c
 *
 * Generates pseudorandom numbers in [0,MAX), one per line.
 *
 * Usage: generate n [s]
 *
 * where n is number of pseudorandom numbers to print
 * and s is an optional seed
 */
 
#define _XOPEN_SOURCE

#include <cs50.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// upper limit on range of integers that can be generated
#define LIMIT 65536

int main(int argc, string argv[])
{
    // TODO: check counter
    if (argc != 2 && argc != 3)
    {
        printf("Usage: ./generate n [s]\n");
        return 1;
    }

    // TODO: n get fitst argv
    int n = atoi(argv[1]);

    // TODO: second argv
    if (argc == 3)
    {   //获取48位运算随机数
        srand48((long) atoi(argv[2]));
    }
    else
    {   //表示设置一个随机种子, 每次运行都能保证随机种子不同
        srand48((long) time(NULL)); //time(NULL)：1900年1月1日到现在的时间秒数
    }

    // TODO: comment me
    for (int i = 0; i < n; i++)
    {
        printf("%i\n", (int) (drand48() * LIMIT));

    }

    // success
    return 0;
}
