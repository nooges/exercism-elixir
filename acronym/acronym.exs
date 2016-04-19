defmodule Acronym do
  @doc """
  Generate an acronym from a string. 
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    string
    |> remove_punctuation
    |> separate_capitals
    |> String.split
    |> Enum.map_join(fn(word) -> String.at(word, 0) end)
    |> String.upcase
  end

  defp remove_punctuation(string) do
    String.replace(string, ~r/[\p{P}]/, " ")
  end

  defp separate_capitals(string) do
    String.replace(string, ~r/(.)([\p{Lu}])/, "\\1 \\2")
  end
end
