class PlayerIo

  def self.import(files)
    players = []
    files.each do |file|
      IO.foreach(file) {|raw_player| players << raw_player.strip}
    end
    players.map {|player| Player.new(player)}
  end

  def self.export(filename, player_collection)
    File.open(filename, 'wb') do |line|
      player_collection.sorted_players.each_with_index do |sorted_players, index|
        line << "Output #{index + 1}: \n"
        sorted_players.each do |player|
          player.attributes.each {|attribute, value| line << "#{value} "}
          line << "\n"
        end
        line << "\n"
      end
    end
  end

end
