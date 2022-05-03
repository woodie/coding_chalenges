// cc fibonacci.c -o fibonacci.out; ./fibonacci.out
#include<stdio.h>
#include <time.h>

int fib(int n) {
  if (n <= 1) return n;
  return fib(n-1) + fib(n-2);
}
 
int main () {
  clock_t start_time = clock();
  fib(40);
  double elapsed_time = (double)(clock() - start_time) / CLOCKS_PER_SEC;
  printf("c........ %f seconds\n", elapsed_time);
}
