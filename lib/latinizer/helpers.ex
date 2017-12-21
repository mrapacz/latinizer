defmodule Latinizer.Helpers do
  @moduledoc false

  @spec map_string(binary, fun) :: binary
  def map_string(string, fun) do
    string
    |> String.graphemes()
    |> Enum.map(fun)
    |> List.to_string()
  end

  @spec map_or_leave_unchanged(binary, map) :: binary
  def map_or_leave_unchanged(char, map), do: Map.get(map, char, char)
end
