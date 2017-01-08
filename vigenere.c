# include <stdio.h>
# include <cs50.h>
# include <ctype.h>
# include <string.h>
int main(int argc, char *argv[]){
    // int i;
    char *key, *plaintext;
    key = argv[1];
    if (argc>2){    //这个if循环用来检查输入是否满足条件
        printf("too much!\n");
        return 1;
    }

    
    else if (isalpha(key[0])){
        for (int i=0, n=strlen(key);i<n;i++)
        { 
            if (key[i]>='0'&&key[i]<='9') //使用ASCII码值进行检查非数字
            {   printf("your input include number :%c\n", key[i]);
                return 1;
            }
        }
            // return 1;
    }
    printf("plaintext:\n");
    plaintext = GetString();
    
    //加密部分.....
}
