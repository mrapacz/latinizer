defmodule Latinizer do
  alias Latinizer.CharacterMap

  @moduledoc """
  A string-translating module for replacing the regional characters with their
  closest latin equivalents.
  """

  @doc """
  Replaces specified regional characters with their closest latin equivalent.

  Returns a string with replaced letters. If the `chars` argument is specified,
  only the letters provided in this argument will be replaced.

  ## Examples
  Translating with no characters specified:

      iex> Latinizer.latinize "gżegżółka"
      "gzegzolka"

  Translating with specified characters:

      iex> Latinizer.latinize "łódeczka", ["ł"]
      "lódeczka"

      iex> Latinizer.latinize "łódeczka", ["ł", "ó"]
      "lodeczka"

      iex> Latinizer.latinize "łódeczka", ["ł", "ó", "Ą", "a"]
      "lodeczka"

  """

  @spec latinize(binary, list) :: binary
  def latinize(string, chars \\ []) do
    character_map = CharacterMap.get_map(chars)

    string
    |> String.graphemes()
    |> Enum.map(&map_to_latin(&1, character_map))
    |> List.to_string()
  end

  defp map_to_latin(char, map), do: Map.get(map, char, char)
end
