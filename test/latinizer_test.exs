defmodule LatinizerTest do
  use ExUnit.Case
  doctest Latinizer

  import Latinizer,
    only: [
      latinize: 1,
      latinize: 2,
      remove_diacritics: 1,
      transcribe: 1
    ]

  describe "latinize/1" do
    test "string in latin chars should not be changed" do
      assert latinize("ACE") == "ACE"
    end

    test "empty string should be translated to an empty string" do
      assert latinize("") == ""
    end

    test "string with non-latin characters should be mapped to latin" do
      assert latinize("ĄĆĘąćęóóóó") == "ACEaceoooo"
    end

    test "string with mixed characters should be mapped to latin" do
      assert latinize("ĄCĆćeĘÓŁLMNJ") == "ACCceEOLLMNJ"
    end
  end

  describe "latinize/2" do
    test "string with all characters specified should be mapped to latin" do
      assert latinize("ŁÓDZIWO", only: ["Ł", "Ó"]) == "LODZIWO"
    end

    test "should map only specified characters" do
      assert latinize("ŁÓÓÓDECZKA", only: ["Ó"]) == "ŁOOODECZKA"
    end
  end

  describe "defdelegates" do
    test "remove_diacritics should be delegated to Diacritic" do
      assert remove_diacritics("ąćę") == "ace"
    end

    test "transcribe should be delegated to Diacritic" do
      assert transcribe("łata") == "lata"
    end
  end
end
