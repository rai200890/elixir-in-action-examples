defmodule TodoList do
  defstruct auto_id: 1, entries: %{}

  def new(), do: %TodoList{}

  def new(entries) when is_list(entries) do
    Enum.reduce(entries, new(), fn entry, result -> add(result, entry) end)
  end

  def add(todolist, entry) do
    entry = Map.put(entry, :id, todolist.auto_id)

    %TodoList{
      entries: Map.put(todolist.entries, todolist.auto_id, entry),
      auto_id: todolist.auto_id + 1
    }
  end

  def update!(todolist, id, updater_fun) when is_function(updater_fun) do
    result = Map.update!(todolist.entries, id, updater_fun)

    %TodoList{
      entries: result,
      auto_id: todolist.auto_id
    }
  end

  def remove(todolist, id) do
    {_, new_map} = Map.pop(todolist.entries, id)

    %TodoList{
      entries: new_map,
      auto_id: todolist.auto_id
    }
  end
end

defmodule TodoList.CSVImporter do
  def parse_date(word), do: String.replace(word, "/", "-") |> Date.from_iso8601!()

  def read!(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Stream.map(&String.split(&1, ","))
    |> Stream.map(fn [date, entry] -> %{date: parse_date(date), entry: entry} end)
    |> Enum.map(& &1)
    |> TodoList.new()
  end
end
