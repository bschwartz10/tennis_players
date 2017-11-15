require './lib/raw_player'
require './lib/player'
require './lib/players_reader'
require './lib/players_writer'
require 'date'

files = ['./input/comma.txt', './input/pipe.txt', './input/space.txt']

raw_players = files.map {|file| PlayersReader.import(file)}
players = raw_players.flatten.map(&:normalize!)
def gender
  -> player {[player.gender, player.last_name]}
end

def date_of_birth_and_last_name
  -> player {[Date.strptime(player.date_of_birth, '%m/%d/%Y'), player.last_name]}
end

def last_name
  -> player {player.last_name}
end

output_1 = players.sort_by(&gender)
output_2 = players.sort_by(&date_of_birth_and_last_name)
output_3 = players.sort_by(&last_name).reverse!

final_output = [output_1, output_2, output_3]
final_output.each {|player_batch| PlayersWriter.export(player_batch)}
