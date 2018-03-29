defmodule TodoListTest do
  use ExUnit.Case
  doctest TodoList

  describe "new" do
    test "when entries are not given" do
      assert TodoList.new() == %TodoList{auto_id: 1, entries: %{}}
    end

    test "when entries are given" do
      assert TodoList.new([
               %{date: ~D[2018-12-19], entry: "Dentist"},
               %{date: ~D[2018-12-20], entry: "Shopping"}
             ]) == %TodoList{
               auto_id: 3,
               entries: %{
                 1 => %{id: 1, date: ~D[2018-12-19], entry: "Dentist"},
                 2 => %{id: 2, date: ~D[2018-12-20], entry: "Shopping"}
               }
             }
    end
  end

  describe "remove" do
    setup do
      %{
        todolist: %TodoList{
          auto_id: 2,
          entries: %{1 => %{date: ~D[2018-12-19], entry: "Farofa", id: 1}}
        }
      }
    end

    test "when key exists", %{todolist: todolist} do
      assert TodoList.remove(todolist, 1) == %TodoList{
               auto_id: 2,
               entries: %{}
             }
    end

    test "when key doesn\'t exist", %{todolist: todolist} do
      assert TodoList.remove(todolist, 2) == todolist
    end
  end

  describe "update!" do
    test "when id exists" do
      list = %TodoList{
        auto_id: 2,
        entries: %{1 => %{date: ~D[2018-12-19], entry: "Farofa", id: 1}}
      }

      result = TodoList.update!(list, 1, &Map.put(&1, :date, ~D[2018-12-20]))

      assert result == %TodoList{
               auto_id: 2,
               entries: %{1 => %{date: ~D[2018-12-20], entry: "Farofa", id: 1}}
             }
    end
  end

  test "add" do
    assert TodoList.add(TodoList.new(), %{date: ~D[2018-12-19], entry: "Farofa"}) == %TodoList{
             auto_id: 2,
             entries: %{1 => %{date: ~D[2018-12-19], entry: "Farofa", id: 1}}
           }
  end
end

defmodule CSVImporterTest do
  use ExUnit.Case

  test "read!" do
    result = TodoList.CSVImporter.read!("./test/fixtures/todos.csv")

    assert result == %TodoList{
             auto_id: 4,
             entries: %{
               1 => %{date: ~D[2018-12-19], entry: "Dentist", id: 1},
               2 => %{date: ~D[2018-12-20], entry: "Shopping", id: 2},
               3 => %{date: ~D[2018-12-19], entry: "Movies", id: 3}
             }
           }
  end
end
