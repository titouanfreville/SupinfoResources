#include <stdio.h>
#include <stdlib.h>

long fact(int x){
  int res = 1;
  for(x;x>1;x=x-1) {
    res = res * x;
  }
}


int main(int argc, char **argv) {
  if  (argc != 2) {
    printf("Factorielle need 1 int arguments");
    return 1;
  }
  int x = atoi(argv[1]);
  printf("Factorielle de %d = %ld \n", x, fact(x));
  return 0;
}