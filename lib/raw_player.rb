class RawPlayer
  attr_reader :raw_player

  def initialize(player_data)
    @raw_player = player_data.gsub(/[,|]/, "").split(' ')
  end

  def normalize!
    delete_middle_initial
    swap_fav_color_and_dob
    format_date_of_birth
    format_gender
    Player.new(raw_player)
  end

private

  def delete_middle_initial
    raw_player.delete_at(2) if raw_player.count == 6
  end

  def swap_fav_color_and_dob
    return unless raw_player[4].include?('-') || raw_player[4].include?('/')
    raw_player[3], raw_player[4] = raw_player[4], raw_player[3]
  end

  def format_date_of_birth
    raw_player[3].tr!('-', '/')
  end

  def format_gender
    raw_player[2] = raw_player[2].start_with?('M') ? 'Male' : 'Female'
  end

end
