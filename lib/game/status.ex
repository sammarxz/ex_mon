defmodule ExMon.Game.Status do
  alias ExMon.Game 

  def print_round_message() do
    IO.puts("\nGame Started!\n")
    IO.inspect(Game.info())
    IO.puts("-----------------------------")
  end

  def print_wrong_move_message(move) do
    IO.puts("\n-------- Invalid Move: #{move} ---------\n")
  end
end