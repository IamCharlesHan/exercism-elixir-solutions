defmodule Acronym do
  @doc """
  Generate an acronym from a string. 
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    string
    |> String.split(" ")
    |> Enum.reduce("", fn(word, acronym) ->
      result = acronym <> String.at(word, 0)
      String.slice(word, 1..-1)
      |> String.codepoints()
      |> Enum.reduce(result, fn(char, newAcro) -> 
        if String.match?(char, ~r/[A-Z]/) do
          newAcro <> char 
        else
          newAcro 
        end
      end)
    end)
    |> String.upcase()
  end
end
