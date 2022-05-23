#!/usr/bin/env elixir

defmodule Main do 
  def fibonacci(1) do 1 end
  def fibonacci(2) do 1 end
  def fibonacci(n) do fibonacci(n-1) + fibonacci(n-2) end
end

start = :os.system_time(:millisecond)
Main.fibonacci(40)
secs = (:os.system_time(:millisecond) - start) * 0.001
IO.puts "elixir... #{Float.ceil(secs, 6)} seconds"
