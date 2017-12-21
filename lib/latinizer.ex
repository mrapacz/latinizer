defmodule Latinizer do
  alias Latinizer.{
    Transcriptions,
    Diacritics
  }

  @moduledoc """
  A module allowing one to replace regional characters in strings with their
  closest latin equivalents.

  The module takes care of both transcription and removal of diacritical signs.
  """

  @doc """
  Replaces regional characters in the given string with their closest latin equivalents.

  Returns a string with replaced letters. If the `:only` argument is specified,
  only the letters provided in this argument will be replaced.

  ## Examples
  Translating with no characters specified:

      iex> Latinizer.latinize ""
      ""

      iex> Latinizer.latinize "хорошо"
      "horosho"

      iex> Latinizer.latinize "gżegżółka"
      "gzegzolka"

      iex> Latinizer.latinize "Pchnij w tę łódź jeża lub ośm skrzyń fig."
      "Pchnij w te lodz jeza lub osm skrzyn fig"

      iex> Latinizer.latinize "В начале было Слово, и Слово было у Бога, и Слово было Бог."
      "V nachale bylo Slovo i Slovo bylo u Boga i Slovo bylo Bog"

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
    string
    |> Transcriptions.transcribe(opts)
    |> Diacritics.remove_diacritics(opts)
  end

  defdelegate transcribe(string, opts \\ []), to: Latinizer.Transcriptions
  defdelegate remove_diacritics(string, opts \\ []), to: Latinizer.Diacritics
end
