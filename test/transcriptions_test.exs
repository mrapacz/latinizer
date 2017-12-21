defmodule TranscriptionsTest do
  use ExUnit.Case
  doctest Latinizer.Transcriptions
  alias Latinizer.{Transcriptions, Diacritics}

  test "diacritic mappings should not be included in the character map" do
    reduntant_mappings =
      Transcriptions.get_map()
      |> Enum.filter(fn {key, value} -> Diacritics.remove_diacritics(key) == value end)

    assert reduntant_mappings == []
  end
end
