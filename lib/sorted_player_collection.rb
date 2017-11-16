class SortedPlayerCollection

  def self.sort_players(players)
    sorted_players = []
    sorted_players << players.sort_by(&gender)
    sorted_players << players.sort_by(&date_of_birth_and_last_name)
    sorted_players << players.sort_by(&last_name).reverse
  end

private
  def self.gender
    -> player {[player.attributes[:gender], player.attributes[:last_name]]}
  end

  def self.date_of_birth_and_last_name
    -> player {[Date.strptime(player.attributes[:date_of_birth], '%m/%d/%Y'), player.attributes[:last_name]]}
  end

  def self.last_name
    -> player {player.attributes[:last_name]}
  end

end
