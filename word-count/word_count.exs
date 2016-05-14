defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> String.downcase
    |> String.replace(~r/[!"#$%&'()*+,\.:;<=>?@[\\\]^`{|}~]/, "")
    |> String.split([" ", "_"])
    |> Enum.reduce(%{}, fn(word, map) ->
      cond do
        word == "" -> map
        map[word] != nil -> %{map | word => map[word]+1}
        true -> Map.put(map, word, 1)
      end
    end)
  end
end
