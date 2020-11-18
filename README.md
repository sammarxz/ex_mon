# ExMon

## How to use

#### Create Player
```elixir
player = ExMon.create_player("Akenathon", :chute, :soco, :cura)
```

#### Start the game
```elixir
ExMon.start_game(player)
```

#### Make Move
```elixir
ExMon.make_move(:chute)
```

#### Get Game Info
```elixir
ExMon.Game.info()
```
