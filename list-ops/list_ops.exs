defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    cond do
      l == [] -> 0
      l != nil -> count(l, 0)
      true -> 0
    end
  end

  defp count(l, acc) do
    [h | t] = l
    cond do
      h == [] -> 0
      h != nil && t == [] -> acc + 1
      h != nil && t != nil -> count(t, acc + 1)
      true -> 0
    end
  end

  @spec reverse(list) :: list
  def reverse(l) do
    reduce(l, [], fn(x, acc) ->
      append([x], acc)
    end) 
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do

  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do

  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do
    cond do
      l == [] -> acc
      true ->
        [head | tail] = l
        reduce(tail, f.(head, acc), f)
    end
  end

  @spec append(list, list) :: list
  def append(a, b) do
    _append(a, b)
  end

  defp _append([], []), do: []
  defp _append([], b), do: b
  defp _append(a, []), do: a
  defp _append([head | tail], b), do: [head | _append(tail, b)]

  @spec concat([[any]]) :: [any]
  def concat(ll) do

  end
end
