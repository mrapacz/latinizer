defmodule Latinizer.Transcriptions do
  @moduledoc """
  A module storing character mappings used for transcription
  (i.e. map containing anything that's not a diacritical sign).
  """

  alias Latinizer.Helpers

  @doc """
  Returns all of the character mappings as a single transcription map.

  ## Examples

      iex> Latinizer.Transcriptions.get_map |> Enum.take(5) |> Map.new
      %{"ĸ" => "k", "œ" => "oe", "Ф" => "F", "ч" => "ch", "ш" => "sh"}

      iex> Latinizer.Transcriptions.get_map |> Map.size
      113

  """
  @spec get_map() :: map()
  def get_map(),
    do: %{
      "ъ" => "",
      "ь" => "",
      "&#039;" => "",
      "Ь" => "",
      "&quot;" => "",
      "Ъ" => "",
      "&amp;" => "",
      "&lt;" => "",
      "&gt;" => "",
      "а" => "a",
      "А" => "A",
      "&Auml;" => "A",
      "&auml;" => "ae",
      "Æ" => "Ae",
      "æ" => "ae",
      "Ä" => "Ae",
      "ä" => "ae",
      "б" => "b",
      "Б" => "B",
      "ц" => "c",
      "Ц" => "C",
      "Ч" => "CH",
      "ч" => "ch",
      "ð" => "d",
      "Ð" => "D",
      "Đ" => "D",
      "д" => "d",
      "Д" => "D",
      "đ" => "d",
      "е" => "e",
      "э" => "e",
      "Е" => "E",
      "Э" => "E",
      "ф" => "f",
      "ƒ" => "f",
      "Ф" => "F",
      "г" => "g",
      "Г" => "G",
      "ħ" => "h",
      "Х" => "H",
      "х" => "h",
      "Ħ" => "H",
      "и" => "i",
      "ı" => "i",
      "И" => "I",
      "Ĳ" => "IJ",
      "ĳ" => "ij",
      "ый" => "iy",
      "к" => "k",
      "К" => "K",
      "ĸ" => "k",
      "л" => "l",
      "ł" => "l",
      "Л" => "L",
      "Ł" => "L",
      "ŀ" => "l",
      "Ŀ" => "L",
      "м" => "m",
      "М" => "M",
      "ŉ" => "n",
      "ŋ" => "n",
      "н" => "n",
      "Н" => "N",
      "Ŋ" => "N",
      "Ø" => "O",
      "о" => "o",
      "О" => "O",
      "ø" => "o",
      "Œ" => "OE",
      "Ö" => "Oe",
      "ö" => "oe",
      "&ouml;" => "oe",
      "&Ouml;" => "Oe",
      "œ" => "oe",
      "П" => "P",
      "п" => "p",
      "р" => "r",
      "Р" => "R",
      "С" => "S",
      "с" => "s",
      "щ" => "sch",
      "Щ" => "SCH",
      "Ш" => "SH",
      "ш" => "sh",
      "ſ" => "ss",
      "ß" => "ss",
      "þ" => "t",
      "Т" => "T",
      "т" => "t",
      "Þ" => "T",
      "Ŧ" => "T",
      "у" => "u",
      "У" => "U",
      "ü" => "ue",
      "Ü" => "Ue",
      "&Uuml;" => "Ue",
      "&uuml;" => "ue",
      "в" => "v",
      "В" => "V",
      "Й" => "Y",
      "Ы" => "Y",
      "й" => "y",
      "ы" => "y",
      "я" => "ya",
      "Я" => "YA",
      "Ё" => "YO",
      "ё" => "yo",
      "Ю" => "YU",
      "ю" => "yu",
      "з" => "z",
      "З" => "Z",
      "ж" => "zh",
      "Ж" => "ZH"
    }

  @doc """
  Returns a submap of the original transcription map containing only
  the specified characters' mapping to their latin equivalents.

  ## Examples
      iex> Latinizer.Transcriptions.get_map ["ł"]
      %{"ł" => "l"}

      iex> Latinizer.Transcriptions.get_map ["ł", "ó", "Ą"]
      %{"ł" => "l"}

      iex> Latinizer.Transcriptions.get_map ["ф", "Ш", "ö", "ĳ", "ŋ"]
      %{"ö" => "oe", "ĳ" => "ij", "ŋ" => "n",
        "Ш" => "SH", "ф" => "f"}

  """
  @spec get_map(list(binary)) :: map()
  def get_map(chars) do
    get_map() |> Map.take(chars)
  end

  @doc """
  Transcribes specified string.

  ## Examples
      iex> Latinizer.Transcriptions.transcribe "łata"
      "lata"

      iex> Latinizer.Transcriptions.transcribe "Русский"
      "Russkiy"

      iex> Latinizer.Transcriptions.transcribe "Во многих странах мира русский язык включается в программу среднего и высшего образования как иностранный язык."
      "Vo mnogih stranah mira russkiy yazyk vklyuchaetsya v programmu srednego i vysshego obrazovaniya kak inostrannyy yazyk."

  You can also pass the `:only` flag to transcribe only the specified characters:

      iex(4)> Latinizer.Transcriptions.transcribe "многих", only: ["м", "н", "о", "г", "и", "х"]
      "mnogih"

      iex(4)> Latinizer.Transcriptions.transcribe "многих", only: ["м", "н", "о"]
      "mnoгих"
  """
  @spec transcribe(binary, list) :: binary
  def transcribe(string, opts \\ []) do
    character_map =
      case Keyword.get(opts, :only) do
        nil -> get_map()
        chars -> get_map(chars)
      end

    string
    |> Helpers.map_string(&Helpers.map_or_leave_unchanged(&1, character_map))
  end
end
