require './lib/player_io'
require './lib/player'
require './lib/player_collection'
require 'date'

files = ['./input/comma.txt', './input/pipe.txt', './input/space.txt']
players = PlayerIo.import(files)
sorted_players = PlayerCollection.new(players).sort_players
PlayerIo.export('./output/target_output.txt', sorted_players)
