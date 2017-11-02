require './lib/raw_player'
require './lib/player'
require './lib/players_reader'

files = ['./input/comma.txt', './input/pipe.txt', './input/space.txt']

raw_players = files.map {|file| PlayersReader.read_players(file)}
players = raw_players.flatten.map(&:normalize!)
