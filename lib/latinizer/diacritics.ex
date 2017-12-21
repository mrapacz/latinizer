defmodule Latinizer.Diacritics do
  alias Latinizer.Helpers

  @moduledoc """
  A module responsible for removing diacritical signs in strings.
  """

  @doc """
  Removes specified diacritical signs from a given string. If no diacritics are specified,
  all of them will be removed.

  ## Examples
  Default usage:
      iex> Latinizer.Diacritics.remove_diacritics "langue indo-européenne"
      "langue indoeuropeenne"

      iex> Latinizer.Diacritics.remove_diacritics "żubrówka"
      "zubrowka"

  Removing only the specified diacritical signs using the `:only` keyword:

      iex> Latinizer.Diacritics.remove_diacritics "latawiec", only: ["ż", "ą"]
      "latawiec"

      iex> Latinizer.Diacritics.remove_diacritics "żubrówka", only: ["ż"]
      "zubrówka"

      iex> Latinizer.Diacritics.remove_diacritics "żubrówka", only: ["ż", "ą"]
      "zubrówka"

  """
  @spec remove_diacritics(binary, list) :: binary
  def remove_diacritics(string, opts \\ []) do
    fun =
      case Keyword.get(opts, :only) do
        nil ->
          &normalize/1

        chars ->
          map = get_diacritic_mapping(chars)
          &Helpers.map_or_leave_unchanged(&1, map)
      end

    Helpers.map_string(string, fun)
  end

  defp normalize(string) do
    case String.trim(string) do
      "" ->
        string

      _any ->
        string
        |> String.normalize(:nfd)
        |> String.replace(~r/\W/u, "")
    end
  end

  defp get_diacritic_mapping(chars) do
    chars
    |> Enum.map(fn character ->
         case normalize(character) do
           "" -> {character, character}
           normalized -> {character, normalized}
         end
       end)
    |> Enum.filter(fn {key, value} -> key != value end)
    |> Map.new()
  end
end
