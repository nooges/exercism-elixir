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
    _decode(String.codepoints(string), "")
  end

  defp is_alpha(string), do: String.match?(string, ~r/[A-Z]/)

  defp _decode([], decoded_string), do: decoded_string
  defp _decode([n, c | rest], decoded_string) do
    cond do
      is_alpha(c) ->
        repeat = String.to_integer(n)
        _decode(rest, decoded_string <> String.duplicate(c, repeat))
      true ->
        _decode([n <> c] ++ rest, decoded_string)
    end
  end
end
