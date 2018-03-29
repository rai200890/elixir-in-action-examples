defmodule RecursionTest do
  use ExUnit.Case
  doctest Recursion

  describe "list_length" do
    test "when list is empty" do
      assert Recursion.list_length([]) == 0
    end

    test "when list has one element" do
      assert Recursion.list_length([1]) == 1
    end

    test "when list has more than one element" do
      assert Recursion.list_length([2, 1]) == 2
    end
  end

  describe "range" do
    test "when range has length 1" do
      assert Recursion.range(1, 1) == [1]
    end

    test "when range has length > 1" do
      assert Recursion.range(-1, 2) == [-1, 0, 1, 2]
    end
  end

  describe "positive" do
    test "when list is empty" do
      assert Recursion.positive([]) == []
    end

    test "when list has element zero" do
      assert Recursion.positive([0]) == []
    end

    test "when list has only positive elements" do
      assert Recursion.positive([1, 2]) == [1, 2]
    end

    test "when list has positive and negative elements" do
      assert Recursion.positive([-1, 2]) == [2]
    end
  end
end
