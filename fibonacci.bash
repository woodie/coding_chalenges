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

# java..... 0.166000 seconds
# golang... 0.243190 seconds
# c........ 0.376225 seconds
# rust..... 0.425000 seconds
# node..... 0.582000 seconds
# elixir... 1.384001 seconds
# jruby.... 1.985102 seconds
# ruby..... 6.572034 seconds
# python... 11.42842 seconds
