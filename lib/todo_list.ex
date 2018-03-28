defmodule TodoList do

  defstruct auto_id: 1, entries: %{}

  def new(), do: %TodoList{}

  def add(todolist, entry) do
    Map.new([entry, %{id: todolist.auto_id}])
    # Map.put_new(entry, :id, todolist.auto_id)
    # new_entries = Map.put(todolist.entries, :auto_id, new_entry)
    # %TodoList{
    #   entries: new_entries,
    #   auto_id: todolist.auto_id + 1
    # }
  end
end


defmodule TodoList.CSVImporter do

    def read!(path) do
       File.stream!(path) |>
       Stream.map(&(String.replace(&1, "\n", ""))) |>
       Stream.map(&(String.split(&1, ","))) |>
       Stream.map(fn [date, entry] -> %{date:  String.replace(date, "/", "-") |> Date.from_iso8601!, entry: entry} end) |> Enum.map(&(&1))
    end
end
