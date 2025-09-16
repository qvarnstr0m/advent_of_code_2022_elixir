defmodule Day03.Part1 do
  def solve(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&get_duplicate_char/1)
    |> Enum.sum()
  end

  defp get_duplicate_char(line) do
    {left, right} = String.split_at(line, div(String.length(line), 2))
    char = Enum.find(String.graphemes(left), fn ch -> String.contains?(right, ch) end)

    case char do
      <<cp::utf8>> when cp in ?a..?z -> cp - ?a + 1
      <<cp::utf8>> when cp in ?A..?Z -> cp - ?A + 27
      nil -> raise "Found no common char in: #{line}"
      _ -> raise "Unexpected char: #{inspect(char)}"
    end
  end
end

defmodule Day03.Part2 do
  def solve(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.chunk_every(3, 3, :discard)
    |> Enum.map(&get_duplicate_char/1)
    |> Enum.sum()
  end

  defp get_duplicate_char(list_of_three_strings) do
    line = Enum.join(list_of_three_strings)
    {left, right} = String.split_at(line, div(String.length(line), 2))
    char = Enum.find(String.graphemes(left), fn ch -> String.contains?(right, ch) end)

    case char do
      <<cp::utf8>> when cp in ?a..?z -> cp - ?a + 1
      <<cp::utf8>> when cp in ?A..?Z -> cp - ?A + 27
      nil -> raise "Found no common char in: #{line}"
      _ -> raise "Unexpected char: #{inspect(char)}"
    end
  end
end

defmodule Mix.Tasks.Day03 do
  use Mix.Task

  def run(_) do
    {:ok, input} = File.read("inputs/day3.txt")

    IO.puts("Part 1:")
    IO.puts(Day03.Part1.solve(input))
    IO.puts("Part 2:")
    IO.puts(Day03.Part2.solve(input))
  end
end
