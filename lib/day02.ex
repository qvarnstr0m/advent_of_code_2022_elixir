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
      "A" -> 1  # Rock
      "B" -> 2  # Paper
      "C" -> 3  # Scissors
      "X" -> 1  # Rock
      "Y" -> 2  # Paper
      "Z" -> 3  # Scissors
    end
  end

  defp calculate_score({opponent, my_choice}) do
    case {opponent, my_choice} do
      {choice, choice} -> 3 + choice # Draw
      {1, 3} -> 3     # Rock vs Scissors, lose
      {2, 1} -> 1     # Paper vs Rock, lose
      {3, 2} -> 2     # Scissors vs Paper, lose
      _ -> 6 + my_choice # Any other combination, you win
    end
  end
end

defmodule Mix.Tasks.Day02 do
  use Mix.Task

  def run(_) do
    {:ok, input} = File.read("inputs/day2.txt")

    IO.puts("Part 1:")
    IO.puts(Day02.Part1.solve(input))
  end
end
