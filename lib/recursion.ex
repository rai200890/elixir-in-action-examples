defmodule Recursion do
  def list_length([]), do: 0
  def list_length([_head]), do: 1
  def list_length([_head | tail]), do: 1 + list_length(tail)

  def range(from, from), do: [from]
  def range(from, to), do: [from | range(from + 1, to)]

  def positive([head]) when head <= 0, do: []
  def positive([]), do: []
  def positive([head]) when head > 0, do: [head]
  def positive([head | tail]) when head > 0, do: [head | positive(tail)]
  def positive([head | tail]) when head <= 0, do: positive(tail)
end
