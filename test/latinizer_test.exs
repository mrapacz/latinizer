defmodule LatinizerTest do
  use ExUnit.Case
  doctest Latinizer
  import Latinizer, only: [latinize: 1, latinize: 2]

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
      assert latinize("ŁÓDZIWO", ["Ł", "Ó"]) == "LODZIWO"
    end

    test "should map only specified characters" do
      assert latinize("ŁÓÓÓDECZKA", ["Ó"]) == "ŁOOODECZKA"
    end
  end
end
