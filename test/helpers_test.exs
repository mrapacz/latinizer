defmodule HelpersTest do
  use ExUnit.Case

  alias Latinizer.Helpers

  test "map_string should map characters correctly" do
    assert Helpers.map_string("abcdef", fn _ -> "a" end) == "aaaaaa"
  end

  test "map_or_leave_unchanged should replace characters when present in the map" do
    assert Helpers.map_or_leave_unchanged("a", %{"a" => "b"}) == "b"
  end

  test "map_or_leave_unchanged should leave the character unchanged when not present in the map" do
    assert Helpers.map_or_leave_unchanged("a", %{}) == "a"
  end
end
