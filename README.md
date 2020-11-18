# ExMon

## How to use

#### Enter in Iex Mode
```bash
$ iex -S mix
```

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
ExMon.make_move(:cura)
```

#### Get Game Info
```elixir
ExMon.Game.info()
```

#### Run Tests
```elixir
mix test
```
