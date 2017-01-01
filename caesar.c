# include <stdio.h>
# include <cs50.h>
# include <string.h>
# include <stdlib.h>
# include <ctype.h>

int main (int argc, char *argv[]){
    int k;
    char * text;

    if (argc>2||argv[1]==NULL) // 限制参数非空
    {
        printf("ohh!!!!\n");
        return 1;
    }
    k = atoi(argv[1])%26; // 命令行参数int化 以26为一周期
    printf("请输入你想加密的字符串:\n");
    text = GetString(); //获得字符串
    printf("使用了ROT%d进行加密\n", k);
    printf("加密中............\n");
    printf("结果为：\n");
    for (int i=0, n=strlen(text);i<n;i++)
    {
        if ((96<text[i]+k&&text[i]+k<123)||(64<text[i]+k&&text[i]+k<91)) // lower 96<x<123
        {
            
            printf("%c", text[i]+k);
            continue;
        }
        else if ((96<text[i]&&text[i]<123)||(64<text[i]&&text[i]<91)) // lower 96<x<123
        {
            printf("%c", text[i]+k-26);
        }else{
            printf("%c", text[i]);
            }
    }
    printf("\n");
    // return 0;
}
