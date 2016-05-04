defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    _encode(String.codepoints(string), "")
  end

  defp _encode([], encoded_string), do: encoded_string
  defp _encode([n, c, c | rest], encoded_string) when is_number(n), do: _encode([n+1, c] ++ rest, encoded_string)
  defp _encode([n, c | rest], encoded_string) when is_number(n), do: _encode(rest, encoded_string <> to_string(n) <> c)
  defp _encode([c | rest], encoded_string), do: _encode([1, c] ++ rest, encoded_string)

  @spec decode(String.t) :: String.t
  def decode(string) do
    string
    |> String.replace(~r/(\d+\w)/, "\\1 ")
    |> String.split
    |> Enum.map_join(&(expand_token(&1)))
  end

  def expand_token(token) do
    {count_str, char} = String.split_at(token, -1)
    count = String.to_integer(count_str)
    String.duplicate(char, count)
  end
end
