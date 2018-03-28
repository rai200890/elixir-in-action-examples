defmodule TodoListTest do
  use ExUnit.Case
  doctest TodoList
  test "new" do
    assert TodoList.new == %TodoList{auto_id: 1, entries: %{}}
  end
  test "add" do
    assert TodoList.add(TodoList.new, %{date: ~D[2018-12-19], entry: "Farofa"}) == []
  end
end
defmodule CSVImporterTest do
  use ExUnit.Case
  test "read" do
    result = TodoList.CSVImporter.read!("./test/fixtures/todos.csv")
    assert result == [
      %{date: ~D[2018-12-19], entry: "Dentist"},
      %{date: ~D[2018-12-20], entry: "Shopping"},
      %{date: ~D[2018-12-19], entry: "Movies"}
    ]
  end
end
