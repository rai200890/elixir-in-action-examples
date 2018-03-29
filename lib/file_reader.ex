defmodule FileReader do
  def lines_lengths!(path),
    do: get_lines!(path) |> Stream.map(&String.length(&1)) |> Enum.map(& &1)

  def longest_line_length!(path), do: lines_lengths!(path) |> Enum.max(& &1)

  def longest_line!(path) do
    get_lines!(path)
    |> Stream.filter(&(String.length(&1) == longest_line_length!(path)))
    |> Enum.map(& &1)
    |> hd
  end

  def words_per_line!(path),
    do: get_lines!(path) |> Stream.map(&String.split(&1)) |> Enum.map(&length(&1))

  defp get_lines!(path), do: File.stream!(path) |> Stream.map(&String.replace(&1, "\n", ""))
end
