class RawPlayer
  attr_reader :raw_player

  def initialize(raw_player)
    @raw_player = raw_player.gsub(/[,|]/, "").split(' ')
  end

end
