defmodule Bob do
  def hey(input) do
    cond do
        String.last(input) == "?" -> "Sure."
        String.strip(input) == "" -> "Fine. Be that way!"
        input == String.upcase(input) && String.match?(input, ~r/\p{L}/) -> "Whoa, chill out!"
        true -> "Whatever."
    end
  end
end
