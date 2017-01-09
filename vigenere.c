# include <stdio.h>
# include <cs50.h>
# include <ctype.h>
# include <string.h>


int main(int argc, char *argv[]){
    int len;
    char *key, *plaintext;

    if (argc>2||argv[1]==NULL){    //这个if循环用来检查输入个数
        printf("too much!\n");
        return 1;
    }
    else { //检查输入是否满足条件
        key = argv[1];
        len = strlen(key);
        for (int i=0;i<len;i++)
        { 
            if (key[i]<'A'||key[i]>'z'||(key[i]>'Z'&&key[i]<'a')) //使用ASCII码值进行检查非数字
            {   printf("invalid input:%c\n", key[i]);
                return 1;
            }
        }
    }
    printf("plaintext:\n");
    plaintext = GetString();
    printf("ciphertext:\n");
    for(int i=0, j=0, n=strlen(plaintext);i<n;i++, j++)
    {

        if ((plaintext[i]>='A'&&plaintext[i]<='Z')||(plaintext[i]>='a'&&plaintext[i]<='z')) //留字符串部分
        {   //检查明文是否为大小写字母
            if (i%len==0&&i!=0) //key长度小于明文时调头
                j = 0;
            if (plaintext[i]>='A'&&plaintext[i]<='Z') //大写部分
                {
                plaintext[i] = plaintext[i]+(key[j]-'A'); //加密后
                while (plaintext[i]>'Z')
                    plaintext[i]-= 26;
                printf("%c", plaintext[i]);
                }
                
            if (plaintext[i]>='a'&&plaintext[i]<='z') //小写部分
                {
                    plaintext[i] = plaintext[i]+(key[j]-'a'); //加密后
                    // printf("ok\n");
                    //  if (plaintext[i]>'z')
                    // printf("no%c", (plaintext[i]-('a'-'G')));
                    printf("%c", plaintext[i]);
                }
            }else{ //输出非字符
                printf("%c",  plaintext[i]);
                j = j - 1;}
        }
    printf("\n");
    return 0;
    }


