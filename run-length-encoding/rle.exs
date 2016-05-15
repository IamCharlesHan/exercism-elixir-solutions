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
    cond do
      string == "" -> ""
      String.length(string) > 0 ->
        String.codepoints(string)
        |> Enum.reduce(%{}, fn(i, acc) ->
          Map.update(acc, i, 1, &(&1 + 1))
        end)
        |> Enum.reduce("", fn({key, value}, acc) ->
          acc <> "#{value}#{key}"
        end)
      true -> ""
    end
  end

  @spec decode(String.t) :: String.t
  def decode(string) do

  end
end
