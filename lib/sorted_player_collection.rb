class SortedPlayerCollection
  attr_reader :players, :sorted_players

  def initialize(players)
    @sorted_players = sort_players(players)
  end

  def sort_players(players)
    sorted_players = []
    sorted_players << players.sort_by(&gender)
    sorted_players << players.sort_by(&date_of_birth_and_last_name)
    sorted_players << players.sort_by(&last_name).reverse
  end

private
  def gender
    -> player {[player.attributes[:gender], player.attributes[:last_name]]}
  end

  def date_of_birth_and_last_name
    -> player {[Date.strptime(player.attributes[:date_of_birth], '%m/%d/%Y'), player.attributes[:last_name]]}
  end

  def last_name
    -> player {player.attributes[:last_name]}
  end
end
