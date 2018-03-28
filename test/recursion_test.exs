defmodule RecursionTest do
  use ExUnit.Case
  doctest Recursion
  test "list_length" do
    assert Recursion.list_length([]) == 0
    assert Recursion.list_length([1]) == 1
    assert Recursion.list_length([2, 1]) == 2
  end
  test "range" do
    assert Recursion.range(1,1) == [1]
    assert Recursion.range(1, 2) == [1,2]
    assert Recursion.range(-1, 2) == [-1, 0, 1, 2]
  end
  test "positive" do
    assert Recursion.positive([]) == []
    assert Recursion.positive([0]) == []
    assert Recursion.positive([1, 2]) == [1,2]
    assert Recursion.positive([-1, 2]) == [2]
  end
end
