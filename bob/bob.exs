defmodule Bob do
  def hey(input) do
    cond do
      String.strip(input) |> String.equivalent?("") -> "Fine. Be that way!"
      String.ends_with?(input, ".") -> "Whatever."
      String.ends_with?(input, "!") ->
        cond do
          String.at(input, -2) |> String.match?(~r/[a-z]/) -> "Whatever."
          true -> "Whoa, chill out!"
        end
      String.ends_with?(input, "?") -> "Sure."
      String.last(input) |> String.match?(~r/[A-Z]/) -> "Whoa, chill out!"
      String.last(input) |> String.match?(~r/[0-9]/) -> "Whatever."
      true -> "Whoa, chill out!"
    end
  end
end
