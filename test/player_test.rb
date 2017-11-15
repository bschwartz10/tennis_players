require './test/test_helper'

class RawPlayersTest < Minitest::Test
  attr_reader :comma_player, :pipe_player, :space_player

  def setup
    @comma_player = Player.new("Abercrombie, Neil, Male, Tan, 2/13/1943")
    @pipe_player = Player.new("Smith | Steve | D | M | Red | 3-3-1985")
    @space_player = Player.new("Kournikova Anna F F 6-3-1975 Red")
  end

  def test_a_player_can_be_created_through_reading_txt_file
    files = ['./input/comma.txt', './input/pipe.txt', './input/space.txt']
    players = PlayerIo.import(files)
    assert_instance_of Player, players.first
  end

  def test_comma_player_is_an_insatance_of_player
    assert_instance_of Player, comma_player
  end

  def test_pipe_player_is_an_instance_of_player
    assert_instance_of Player, pipe_player
  end

  def test_space_player_is_an_instance_of_player
    assert_instance_of Player, space_player
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

  def test_comma_player_attributes_after_normalizing
    comma_player_data = "Abercrombie, Neil, Male, Tan, 2/13/1943"
    attributes = {:last_name=>"Abercrombie", :first_name=>"Neil", :gender=>"Male", :date_of_birth=>"2/13/1943", :favorite_color=>"Tan"}
    comma_player.normalize!(comma_player_data)

    assert_equal attributes, comma_player.attributes
  end

  def test_pipe_player_attributes_after_normalizing
    pipe_player_data = "Smith | Steve | D | M | Red | 3-3-1985"
    attributes = {:last_name=>"Smith", :first_name=>"Steve", :gender=>"Male", :date_of_birth=>"3/3/1985", :favorite_color=>"Red"}
    pipe_player.normalize!(pipe_player_data)

    assert_equal attributes, pipe_player.attributes
  end

  def test_space_raw_player_attributes_after_normalizing
    space_player_data = "Kournikova Anna F F 6-3-1975 Red"
    attributes = {:last_name=>"Kournikova", :first_name=>"Anna", :gender=>"Female", :date_of_birth=>"6/3/1975", :favorite_color=>"Red"}
    space_player.normalize!(space_player_data)

    assert_equal attributes, space_player.attributes
  end

  def test_format_date_of_birth_replaces_dashes_with_slashes_for_pipe_raw_player
    pipe_player_struct = Player::PipePlayer.new("Smith", "Steve", "D", "M", "Red", "3-3-1985")

    assert_equal "3/3/1985", pipe_player.send(:format_date_of_birth, pipe_player_struct)
  end

  def test_format_date_of_birth_replaces_dashes_with_slashes_for_space_raw_player
    space_player_struct = Player::SpacePlayer.new("Kournikova", "Anna", "F", "F", "6-3-1975", "Red")

    assert_equal "6/3/1975", space_player.send(:format_date_of_birth, space_player_struct)
  end

  def test_format_gender_replaces_m_with_male_for_pipe_raw_player
    pipe_player_struct = Player::PipePlayer.new("Smith", "Steve", "D", "M", "Red", "3-3-1985")

    assert_equal 'Male', pipe_player.send(:format_gender, pipe_player_struct)
  end

  def test_format_gender_replaces_f_with_female_for_space_raw_player
    space_player_struct = Player::SpacePlayer.new("Kournikova", "Anna", "F", "F", "6-3-1975", "Red")

    assert_equal 'Female', space_player.send(:format_gender, space_player_struct)
  end

  def test_match_attributes_creates_attributes_hash_from_space_player_struct
    space_player_struct = Player::SpacePlayer.new("Kournikova", "Anna", "F", "Female", "6/3/1975", "Red")
    attributes = {:last_name=>"Kournikova", :first_name=>"Anna", :gender=>"Female", :date_of_birth=>"6/3/1975", :favorite_color=>"Red"}

    assert_equal attributes, space_player.send(:match_attributes, space_player_struct)
  end

  def test_match_attributes_creates_attributes_hash_from_comma_struct
    comma_player_struct = Player::CommaPlayer.new("Abercrombie", "Neil", "Male", "Tan", "2/13/1943")
    attributes = {:last_name=>"Abercrombie", :first_name=>"Neil", :gender=>"Male", :date_of_birth=>"2/13/1943", :favorite_color=>"Tan"}

    assert_equal attributes, comma_player.send(:match_attributes, comma_player_struct)
  end
  
  def test_match_attributes_creates_attributes_hash_from_pipe_struct
    pipe_player_struct = Player::PipePlayer.new("Smith", "Steve", "D", "Male", "Red", "3/3/1985")
    attributes = {:last_name=>"Smith", :first_name=>"Steve", :gender=>"Male", :date_of_birth=>"3/3/1985", :favorite_color=>"Red"}

    assert_equal attributes, pipe_player.send(:match_attributes, pipe_player_struct)
  end

end
