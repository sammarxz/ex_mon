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

      nessages = capture_io(fn -> 
        assert ExMon.start_game(player) == :ok
      end)

      assert nessages  =~ "The game is started"
      assert nessages  =~ "status: :started"
      assert nessages  =~ "turn: :player"
    end
  end
end
