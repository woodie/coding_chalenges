#!/usr/bin/java --source 11
class fibonacci {

    static int fib(int n) {
        if (n <= 2) return 1;
        return fib(n - 1) + fib(n - 2);
    }
 
    public static void
    main(String args[]) {
        long start = System.currentTimeMillis();
        fib(40);
        long millis = System.currentTimeMillis() - start;
        System.out.printf("java..... %.6f seconds%n", millis/1e3);
    }
}
