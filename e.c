#include <stdio.h>
#include <string.h>

int main ()
{
char string[]=  "abc/qwe/jkh";
char *array[10];
int i=0, j;

array[i] = strtok(string,"/");

while(array[i]!=NULL)
{
   array[++i] = strtok(NULL,"/");
}

for (j=0; j<i; j++) {
  printf("%s\n",array[j]);
}
}
