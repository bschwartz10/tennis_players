require './test/test_helper'

class RawPlayersTest < Minitest::Test
  attr_reader :comma_raw_player, :pipe_raw_player, :space_raw_player

  def setup
    @comma_raw_player = RawPlayer.new("Abercrombie, Neil, Male, Tan, 2/13/1943")
    @pipe_raw_player = RawPlayer.new("Smith | Steve | D | M | Red | 3-3-1985")
    @space_raw_player = RawPlayer.new("Kournikova Anna F F 6-3-1975 Red")
  end

  def test_a_raw_player_can_be_created_through_reading_txt_file
    file = './input/comma.txt'
    raw_players = PlayersReader.read_players(file)
    assert_instance_of RawPlayer, raw_players.first
  end

  def test_raw_player_is_initialized_into_an_array
    assert_instance_of Array, comma_raw_player.raw_player
  end

  def test_comma_raw_player_after_normalizing
    normalized_player = ["Abercrombie", "Neil", "Male", "2/13/1943", "Tan"]
    comma_raw_player.normalize!

    assert_equal comma_raw_player.raw_player, normalized_player
  end

  def test_pipe_raw_player_after_normalizing
    normalized_player = ["Smith", "Steve", "Male", "3/3/1985", "Red"]
    pipe_raw_player.normalize!

    assert_equal pipe_raw_player.raw_player, normalized_player
  end

  def test_space_raw_player_after_normalizing
    normalized_player = ["Kournikova", "Anna", "Female", "6/3/1975", "Red"]
    space_raw_player.normalize!

    assert_equal space_raw_player.raw_player, normalized_player
  end

  def test_delete_middle_initial_removes_mi_index_for_a_six_length_array
    pipe_raw_player.send(:delete_middle_initial)

    assert_equal 5, pipe_raw_player.raw_player.length
  end

  def test_delete_middle_initial_doesnt_remove_mi_index_for_a_five_length_array
    space_raw_player.send(:delete_middle_initial)

    assert_equal 5, comma_raw_player.raw_player.length
  end

  def test_swap_fav_color_and_dob_swaps_for_comma_raw_player
    comma_raw_player.send(:swap_fav_color_and_dob)

    assert_equal "2/13/1943", comma_raw_player.raw_player[3]
    assert_equal "Tan", comma_raw_player.raw_player[4]
  end

  def test_swap_fav_color_and_dob_swaps_for_pipe_raw_player
    pipe_raw_player.send(:delete_middle_initial)
    pipe_raw_player.send(:swap_fav_color_and_dob)

    assert_equal "3-3-1985", pipe_raw_player.raw_player[3]
    assert_equal "Red", pipe_raw_player.raw_player[4]
  end

  def test_swap_fav_color_and_dob_doesnt_swap_for_space_raw_player
    space_raw_player.send(:delete_middle_initial)
    space_raw_player.send(:swap_fav_color_and_dob)

    assert_equal "6-3-1975", space_raw_player.raw_player[3]
    assert_equal "Red", space_raw_player.raw_player[4]
  end

  def test_format_date_of_birth_replaces_dashes_with_slashes_for_pipe_raw_player
    pipe_raw_player.send(:delete_middle_initial)
    pipe_raw_player.send(:swap_fav_color_and_dob)
    pipe_raw_player.send(:format_date_of_birth)

    assert_equal "3/3/1985", pipe_raw_player.raw_player[3]
  end

  def test_format_date_of_birth_replaces_dashes_with_slashes_for_space_raw_player
    space_raw_player.send(:delete_middle_initial)
    space_raw_player.send(:swap_fav_color_and_dob)
    space_raw_player.send(:format_date_of_birth)

    assert_equal "6/3/1975", space_raw_player.raw_player[3]
  end

  def test_format_gender_replaces_m_with_male_for_pipe_raw_player
    pipe_raw_player.send(:delete_middle_initial)
    pipe_raw_player.send(:swap_fav_color_and_dob)
    pipe_raw_player.send(:format_date_of_birth)
    pipe_raw_player.send(:format_gender)

    assert_equal 'Male', pipe_raw_player.raw_player[2]
  end

  def test_format_gender_replaces_m_with_female_for_space_raw_player
    space_raw_player.send(:delete_middle_initial)
    space_raw_player.send(:swap_fav_color_and_dob)
    space_raw_player.send(:format_date_of_birth)
    space_raw_player.send(:format_gender)

    assert_equal 'Female', space_raw_player.raw_player[2]
  end

end
