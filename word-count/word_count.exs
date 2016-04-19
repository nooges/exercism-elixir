defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> remove_punctuation
    |> String.downcase
    |> String.split
    |> count_words
  end

  defp remove_punctuation(sentence) do
    String.replace(sentence, ~r/[^\p{L}\p{N}-]/u, " ")
  end

  defp count_words(words), do: count_words(words, %{})
  defp count_words([], acc), do: acc
  defp count_words([first|rest], acc) do
    count_words(rest, Map.update(acc, first, 1, &(&1 + 1)))
  end
end
