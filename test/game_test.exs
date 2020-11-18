defmodule ExMon.GameTest do
  use ExUnit.Case

  alias ExMon.{Game, Player}

  describe "start/2" do
    test "starts the game state" do
      player = Player.build("Akenthon", :chute, :soco, :cura)
      computer = Player.build("Aton", :chute, :soco, :cura)

      assert {:ok, _pid} = Game.start(computer, player)
    end
  end

  describe "info/0" do
    test "returns the current game state" do
      player = Player.build("Akenthon", :chute, :soco, :cura)
      computer = Player.build("Aton", :chute, :soco, :cura)

      Game.start(computer, player)

      expected_response = %{
        computer: %Player{
          life: 100, 
          moves: %{
            move_avg: :soco, 
            move_heal: :cura, 
            move_rnd: :chute
          },
          name: "Aton"
        },
        player: %Player{
          life: 100,
          moves: %{
            move_avg: :soco,
            move_heal: :cura,
            move_rnd: :chute
          }, 
          name: "Akenthon"
        }, 
        status: :started,
        turn: :player
      }

      assert expected_response == Game.info()
    end
  end

  describe "update/1" do
    test "returns the updated game state" do
      player = Player.build("Akenthon", :chute, :soco, :cura)
      computer = Player.build("Aton", :chute, :soco, :cura)

      Game.start(computer, player)

      expected_response = %{
        computer: %Player{
          life: 100,
          moves: %{
            move_avg: :soco,
            move_heal: :cura,
            move_rnd: :chute
          },
          name: "Aton"
        },
        player: %Player{
          life: 100,
          moves: %{
            move_avg: :soco,
            move_heal: :cura,
            move_rnd: :chute
          }, 
          name: "Akenthon"
        }, 
        status: :started,
        turn: :player
      }

      assert expected_response == Game.info()

      new_state = %{
        computer: %Player{
          life: 85,
          moves: %{
            move_avg: :soco,
            move_heal: :cura,
            move_rnd: :chute
          },
          name: "Aton"
        },
        player: %Player{
          life: 50,
          moves: %{
            move_avg: :soco,
            move_heal: :cura,
            move_rnd: :chute
          }, 
          name: "Akenthon"
        }, 
        status: :started,
        turn: :player
      }

      Game.update(new_state)

      expected_response = %{new_state | turn: :computer, status: :continue}

      assert expected_response == Game.info()
    end
  end
end