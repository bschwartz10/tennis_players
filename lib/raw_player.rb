class RawPlayer
  attr_reader :raw_player

  def initialize(player_data)
    @raw_player = create_player_structs(player_data)
  end

  def normalize!
    format_date_of_birth
    format_gender
    NormalizedPlayer.new(raw_player.last_name, raw_player.first_name, raw_player.gender, raw_player.date_of_birth, raw_player.favorite_color)
  end

private
  CommaPlayer = Struct.new(:last_name, :first_name, :gender, :favorite_color, :date_of_birth)
  PipePlayer = Struct.new(:last_name, :first_name, :middle_initial, :gender, :favorite_color, :date_of_birth)
  SpacePlayer = Struct.new(:last_name, :first_name, :middle_initial, :gender, :date_of_birth, :favorite_color)
  NormalizedPlayer = Struct.new(:last_name, :first_name, :gender, :date_of_birth, :favorite_color)

  def create_player_structs(player_data)
    remove_spaces_for_comma_and_pipe_players(player_data)
    if player_data.include?(',')
      normalized_data = player_data.split(',')
      create_five_attribute_struct(normalized_data, CommaPlayer)
    elsif player_data.include?('|')
      normalized_data = player_data.split('|')
      create_six_attribute_struct(normalized_data, PipePlayer)
    else
      normalized_data = player_data.split(' ')
      create_six_attribute_struct(normalized_data, SpacePlayer)
    end
  end

  def create_five_attribute_struct(normalized_data, player_type)
    player_type.new(normalized_data[0], normalized_data[1], normalized_data[2], normalized_data[3], normalized_data[4])
  end

  def create_six_attribute_struct(normalized_data, player_type)
    player_type.new(normalized_data[0], normalized_data[1], normalized_data[2], normalized_data[3], normalized_data[4], normalized_data[5])
  end

  def remove_spaces_for_comma_and_pipe_players(player_data)
    player_data.tr!(' ', '') if player_data.include?(',') || player_data.include?('|')
  end

  def format_date_of_birth
    raw_player.date_of_birth.tr!('-', '/')
  end

  def format_gender
    raw_player.gender = raw_player.gender.start_with?('M') ? 'Male' : 'Female'
  end

end
