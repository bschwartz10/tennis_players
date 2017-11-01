require './test/test_helper'

class RawPlayersTest < Minitest::Test

  def test_a_raw_player_can_be_created_through_reading_txt_file
    file = './input/comma.txt'
    raw_players = PlayersReader.read_players(file)

    assert_instance_of RawPlayer, raw_players.first
  end

end
