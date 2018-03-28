defmodule FileReaderTest do
  use ExUnit.Case
  doctest FileReader
  test "lines_lengths!" do
    assert FileReader.lines_lengths!("arquivo.txt") == [2, 5, 5]
  end
  test "longest_line_length!" do
    assert FileReader.longest_line_length!("arquivo.txt") == 5
  end
  test "longest_line!" do
    assert FileReader.longest_line!("arquivo.txt") == "OIIII"
  end
  test "words_per_line!" do
    assert FileReader.words_per_line!("arquivo.txt") == [1,1,1]
  end
end
