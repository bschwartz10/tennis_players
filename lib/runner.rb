require './lib/player_io'
require './lib/player'
require './lib/sorted_player_collection'
require 'date'

files = ['./input/comma.txt', './input/pipe.txt', './input/space.txt']
players = PlayerIo.import(files)
sorted_players = SortedPlayerCollection.new(players)
PlayerIo.export('./output/target_output.txt', sorted_players)
