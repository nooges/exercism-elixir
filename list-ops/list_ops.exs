defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l), do: _count(l, 0)
  defp _count([], acc), do: acc
  defp _count([head | tail], acc), do: _count(tail, acc + 1)

  @spec reverse(list) :: list
  def reverse(l), do: _reverse(l, [])
  defp _reverse([], acc), do: acc
  defp _reverse([head | tail], acc), do: _reverse(tail, [head | acc])

  @spec map(list, (any -> any)) :: list
  def map([], f), do: []
  def map([head | tail], f), do: [f.(head) | map(tail, f)]

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], f), do: []
  def filter([head | tail], f) do
    cond do
      f.(head) -> [head | filter(tail, f)]
      true -> filter(tail, f)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, f), do: acc
  def reduce([head | tail], acc, f), do: reduce(tail, f.(head, acc), f)

  @spec append(list, list) :: list
  def append(a, b), do: _append(reverse(a), b)
  defp _append([], b), do: b
  defp _append([head | tail], b), do: _append(tail, [head | b])

  @spec concat([[any]]) :: [any]
  def concat(ll) do

  end
end
