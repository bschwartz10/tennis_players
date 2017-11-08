class PlayersWriter
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
