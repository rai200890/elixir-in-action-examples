defmodule FileReaderTest do
  use ExUnit.Case
  doctest FileReader

  setup do
    %{path: "test/fixtures/file_reader.txt"}
  end

  test "lines_lengths!", %{path: path} do
    assert FileReader.lines_lengths!(path) == [136, 136, 130, 136, 136, 135, 27]
  end

  test "longest_line_length!", %{path: path} do
    assert FileReader.longest_line_length!(path) == 136
  end

  test "longest_line!", %{path: path} do
    assert FileReader.longest_line!(path) ==
             "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In interdum vestibulum laoreet. Nunc et neque nec ante euismod vulputate in sit"
  end

  test "words_per_line!", %{path: path} do
    assert FileReader.words_per_line!(path) == [21, 22, 18, 19, 22, 20, 4]
  end
end
