require './test/test_helper'

class PlayerTest < Minitest::Test
  attr_reader :player

  def setup
    @player = Player.new(["Abercrombie", "Neil", "Male", "2/13/1943", "Tan"])
  end

  def test_it_is_initialized_with_raw_player_data
    assert_instance_of Player, player
  end

  def test_attributes_is_a_hash
    assert_instance_of Hash, player.attributes
  end

  def test_attributes_has_keys_of_ln_fn_gender_dob_fc
    keys = [:last_name, :first_name, :gender, :date_of_birth, :favorite_color]

    assert_equal player.attributes.keys, keys
  end
end
