defmodule Queue do
  use GenServer

  # Server API
  def start_link(name, initial_state \\ []) do
    GenServer.start_link(__MODULE__, initial_state, name: name)
  end

  def init(state), do: {:ok, state}

  def handle_call(:dequeue, _from, []), do: {:reply, nil, []}

  def handle_call(:dequeue, _from, [head | tail]) do
    {:reply, head, tail}
  end

  def handle_call(:queue, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:enqueue, value}, state) do
    {:noreply, state ++ [value]}
  end

  # Client API
  def enqueue(pid, value), do: GenServer.cast(pid, {:enqueue, value})

  def dequeue(pid), do: GenServer.call(pid, :dequeue)

  def queue(pid), do: GenServer.call(pid, :queue)
end
