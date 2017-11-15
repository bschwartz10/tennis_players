class PlayerIo
  def self.import(file)
    # constructor function
    raw_players = []
    IO.foreach(file) {|raw_player| raw_players << raw_player.strip}
    raw_players.map {|raw_player| Player.new(raw_player)}
  end

  def self.export(player_batch)
    File.open('./output/target_output.txt', 'a+') do |line|
      line << "Output 1: \n"
      player_batch.each do |player|
        player.each {|attribute| line << "#{attribute} "}
        line << "\n"
      end
      line << "\n"
    end
  end

end
