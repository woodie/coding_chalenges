#!/usr/bin/env python3
import time


def fib(n):
    return 1 if n <= 2 else fib(n - 2) + fib(n - 1)


start = time.perf_counter()
fib(40)
print(f"python... {round(time.perf_counter() - start, 6)} seconds")
