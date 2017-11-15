require './test/test_helper'

class RawPlayersTest < Minitest::Test
  attr_reader :comma_player, :pipe_player, :space_player

  def setup
    @comma_player = Player.new("Abercrombie, Neil, Male, Tan, 2/13/1943")
    @pipe_player = Player.new("Smith | Steve | D | M | Red | 3-3-1985")
    @space_player = Player.new("Kournikova Anna F F 6-3-1975 Red")
  end

  def test_a_raw_player_can_be_created_through_reading_txt_file
    file = './input/comma.txt'
    players = PlayersReader.read_players(file)
    assert_instance_of Player, players.first
  end

  def test_comma_raw_player_is_initialized_into_a_struct
    assert_instance_of Player::CommaPlayer, comma_player.player
  end

  def test_pipe_raw_player_is_initialized_into_a_struct
    assert_instance_of Player::PipePlayer, pipe_player.player
  end

  def test_space_raw_player_is_initialized_into_a_struct
    assert_instance_of Player::SpacePlayer, space_player.player
  end

  def test_remove_spaces_for_comma_and_pipe_players_for_comma_player
    comma_player_data = "Abercrombie, Neil, Male, Tan, 2/13/1943"

    assert_equal "Abercrombie,Neil,Male,Tan,2/13/1943", comma_player.send(:remove_spaces_for_comma_and_pipe_players, comma_player_data)
  end

  def test_remove_spaces_for_comma_and_pipe_players_for_pipe_player
    pipe_player_data = "Smith | Steve | D | M | Red | 3-3-1985"

    assert_equal "Smith|Steve|D|M|Red|3-3-1985", pipe_player.send(:remove_spaces_for_comma_and_pipe_players, pipe_player_data)
  end

  def test_remove_spaces_for_comma_and_pipe_players_for_space_player
    space_player_data = "Kournikova Anna F F 6-3-1975 Red"

    assert_nil space_player.send(:remove_spaces_for_comma_and_pipe_players, space_player_data)
  end

  def test_create_five_attribute_struct_for_comma_player
    comma_player_struct = Player::CommaPlayer.new("Abercrombie", "Neil", "Male", "Tan", "2/13/1943")
    normalized_data = ["Abercrombie", "Neil", "Male", "Tan", "2/13/1943"]

    assert_equal comma_player_struct, comma_player.send(:create_five_attribute_player, normalized_data, Player::CommaPlayer)
  end

  def test_create_six_attribute_struct_for_pipe_player
    pipe_player_struct = Player::PipePlayer.new("Smith", "Steve", "D", "M", "Red", "3-3-1985")
    normalized_data = ["Smith", "Steve", "D", "M", "Red", "3-3-1985"]

    assert_equal pipe_player_struct, pipe_player.send(:create_six_attribute_player, normalized_data, Player::PipePlayer)
  end

  def test_create_six_attribute_struct_for_space_player
    space_player_struct = Player::SpacePlayer.new("Kournikova", "Anna", "F", "F", "6-3-1975", "Red")
    normalized_data = ["Kournikova", "Anna", "F", "F", "6-3-1975", "Red"]

    assert_equal space_player_struct, space_player.send(:create_six_attribute_player, normalized_data, Player::SpacePlayer)
  end

  def test_comma_raw_player_after_normalizing
    normalized_player = Player::NormalizedPlayer.new("Abercrombie", "Neil", "Male", "2/13/1943", "Tan")

    assert_equal normalized_player, comma_player.normalize!
  end

  def test_pipe_raw_player_after_normalizing
    normalized_player = Player::NormalizedPlayer.new("Smith", "Steve", "Male", "3/3/1985", "Red")

    assert_equal normalized_player, pipe_player.normalize!
  end

  def test_space_raw_player_after_normalizing
    normalized_player = Player::NormalizedPlayer.new("Kournikova", "Anna", "Female", "6/3/1975", "Red")

    assert_equal normalized_player, space_player.normalize!
  end

  def test_format_date_of_birth_replaces_dashes_with_slashes_for_pipe_raw_player
    assert_equal "3/3/1985", pipe_player.send(:format_date_of_birth)
  end

  def test_format_date_of_birth_replaces_dashes_with_slashes_for_space_raw_player
    assert_equal "6/3/1975", space_player.send(:format_date_of_birth)
  end

  def test_format_gender_replaces_m_with_male_for_pipe_raw_player
    assert_equal 'Male', pipe_player.send(:format_gender)
  end

  def test_format_gender_replaces_f_with_female_for_space_raw_player
    assert_equal 'Female', space_player.send(:format_gender)
  end

end
