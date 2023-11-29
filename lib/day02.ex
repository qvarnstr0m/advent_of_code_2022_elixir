defmodule Day02.Part1 do
  def solve(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_round/1)
    |> Enum.map(&calculate_score/1)
    |> Enum.sum()
  end

  defp parse_round(line) do
    [opponent, my_choice] = String.split(line, " ")
    {char_to_number(opponent), char_to_number(my_choice)}
  end

  defp char_to_number(char) do
    case char do
      "A" -> 1
      "B" -> 2
      "C" -> 3
      "X" -> 1
      "Y" -> 2
      "Z" -> 3
    end
  end

  defp calculate_score({opponent, my_choice}) do
    case {opponent, my_choice} do
      {choice, choice} -> 3 + choice
      {1, 3} -> 3
      {2, 1} -> 1
      {3, 2} -> 2
      _ -> 6 + my_choice
    end
  end
end

defmodule Day02.Part2 do
  def solve(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_round/1)
    |> Enum.map(&calculate_score/1)
    |> Enum.sum()
  end

  defp parse_round(line) do
    [opponent, my_choice] = String.split(line, " ")
    {char_to_number(opponent), char_to_number(my_choice)}
  end

  defp char_to_number(char) do
    case char do
      "A" -> 1
      "B" -> 2
      "C" -> 3
      "X" -> "lose"
      "Y" -> "tie"
      "Z" -> "win"
    end
  end

  defp calculate_score({opponent, outcome}) do
    case {opponent, outcome} do
      {1, "lose"} -> 3
      {2, "lose"} -> 1
      {3, "lose"} -> 2
      {1, "win"} -> 8
      {2, "win"} -> 9
      {3, "win"} -> 7
      {1, "tie"} -> 4
      {2, "tie"} -> 5
      {3, "tie"} -> 6
    end
  end
end

defmodule Mix.Tasks.Day02 do
  use Mix.Task

  def run(_) do
    {:ok, input} = File.read("inputs/day2.txt")

    IO.puts("Part 1:")
    IO.puts(Day02.Part1.solve(input))
    IO.puts("Part 2:")
    IO.puts(Day02.Part2.solve(input))
  end
end
