require './test/test_helper'

class PlayersReaderTest < Minitest::Test
  def test_players_reader_exists
    assert_kind_of Class, PlayersReader
  end

  def test_read_players_method_reads_file_and_returns_array
    file = './input/comma.txt'

    assert_instance_of Array, PlayersReader.read_players(file)
  end

  def test_read_players_method_returns_an_array_of_raw_players
    file = './input/comma.txt'

    assert_instance_of Player, PlayersReader.read_players(file).first
  end
end
