defmodule ExMonTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  alias ExMon.Player

  describe "create_player/1" do
    test "returns a player" do
      expected_response = %Player{
        life: 100,
        moves: %{
          move_avg: :soco,
          move_heal: :cura,
          move_rnd: :chute
        },
        name: "Akenathon"
      }
      assert expected_response == ExMon.create_player("Akenathon", :chute, :soco, :cura)
    end
  end

  describe "start_game/1" do
    test "When the game start, returns a message" do
      player = Player.build("Akenthon", :chute, :soco, :cura)

      messages = capture_io(fn -> 
        assert ExMon.start_game(player) == :ok
      end)

      assert messages  =~ "The game is started"
      assert messages  =~ "status: :started"
      assert messages  =~ "turn: :player"
    end
  end

  describe "make_move/1" do
    setup do
      player = Player.build("Akenthon", :chute, :soco, :cura)

      capture_io(fn -> 
        ExMon.start_game(player)
      end)

      :ok
    end

    test "when the move is valid, do the move. Computer mokes a random move too" do
      messages = capture_io(fn -> 
         ExMon.make_move(:chute)
      end)

      assert messages =~ "The player attacked the computer"
      assert messages =~ "It's computer turn"
      assert messages =~ "It's player turn"
      assert messages =~ "status: :continue"
    end

    test "when the move is invalid, print the error message" do
      messages = capture_io(fn -> 
         ExMon.make_move(:kamehameha)
      end)

      assert messages =~ "Invalid Move: kamehameha"
    end
  end
end
