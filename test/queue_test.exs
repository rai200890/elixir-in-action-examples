defmodule QueueTest do
  use ExUnit.Case
  doctest Queue

  setup do
    {:ok, empty_queue} = Queue.start_link(EmptyQueue)
    {:ok, queue} = Queue.start_link(NonEmptyQueue, [1, 2, 3])

    %{
      empty_queue: empty_queue,
      queue: queue
    }
  end

  describe "enqueue" do
    test "when given item it should enqueue it", %{queue: queue} do
      assert :ok == Queue.enqueue(queue, 4)
    end
  end

  describe "dequeue" do
    test "when list is empty should return nil", %{empty_queue: queue} do
      assert nil == Queue.dequeue(queue)
    end

    test "when list is not empty should return first item", %{queue: queue} do
      assert 1 == Queue.dequeue(queue)
    end
  end

  describe "queue" do
    test "when list is empty should return an empty list", %{empty_queue: queue} do
      assert [] == Queue.queue(queue)
    end

    test "when list is not empty should return it", %{queue: queue} do
      assert [1, 2, 3] == Queue.queue(queue)
    end
  end
end
