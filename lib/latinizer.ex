defmodule Latinizer do
  alias Latinizer.CharacterMap

  @moduledoc """
  A string-translating module for replacing the regional characters with their
  closest latin equivalents.
  """

  @doc """
  Replaces specified regional characters with their closest latin equivalent.

  Returns a string with replaced letters. If the `:only` argument is specified,
  only the letters provided in this argument will be replaced.

  ## Examples
  Translating with no characters specified:

      iex> Latinizer.latinize "gżegżółka"
      "gzegzolka"

      iex> Latinizer.latinize "хорошо"
      "horosho"

      iex> Latinizer.latinize ""
      ""

  You can pass the `:only` option to replace only the specified characters:

      iex> Latinizer.latinize "łódeczka", only: ["ł"]
      "lódeczka"

      iex> Latinizer.latinize "łódeczka", only: ["ł", "ó"]
      "lodeczka"

      iex> Latinizer.latinize "łódeczka", only: ["ł", "ó", "Ą", "a"]
      "lodeczka"

  """

  @spec latinize(binary, list) :: binary
  def latinize(string, opts \\ []) do
    character_map =
      case Keyword.get(opts, :only) do
        nil -> CharacterMap.get_map()
        chars -> CharacterMap.get_map(chars)
      end

    string
    |> String.graphemes()
    |> Enum.map(&map_to_latin(&1, character_map))
    |> List.to_string()
  end

  defp map_to_latin(char, map), do: Map.get(map, char, char)
end
