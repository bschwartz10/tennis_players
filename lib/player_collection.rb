class PlayerCollection
  def gender
    -> player {[player.gender, player.last_name]}
  end

  def date_of_birth_and_last_name
    -> player {[Date.strptime(player.date_of_birth, '%m/%d/%Y'), player.last_name]}
  end

  def last_name
    -> player {player.last_name}
  end
end
