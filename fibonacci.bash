#!/usr/bin/env bash
./fibonacci.sh
./fibonacci.go
cc fibonacci.c -o fibonacci.out; ./fibonacci.out
./fibonacci.rs
./fibonacci.js
./fibonacci.exs
jruby fibonacci.rb
ruby fibonacci.rb
./fibonacci.py

# java..... 0.190000 seconds
# golang... 0.226040 seconds
# c........ 0.350677 seconds
# rust..... 0.420000 seconds
# node..... 0.584000 seconds
# elixir... 1.378001 seconds
# jruby.... 2.003334 seconds
# ruby..... 6.566348 seconds
# python.. 11.279514 seconds
