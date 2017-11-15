class PlayersReader
  def self.read_players(file)
    # constructor function
    raw_players = []
    IO.foreach(file) {|raw_player| raw_players << raw_player.strip}
    raw_players.map {|raw_player| Player.new(raw_player)}
  end
end
