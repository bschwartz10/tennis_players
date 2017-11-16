require './test/test_helper'

class PlayerIoTest < Minitest::Test
  attr_reader :players

  def setup
    files = ['./test/fixtures/comma_test_fixture.txt', './test/fixtures/pipe_test_fixture.txt', './test/fixtures/space_test_fixture.txt']
    @players = PlayerIo.import(files)
    sorted_players = SortedPlayerCollection.sort_players(players)
    PlayerIo.export('./test/output/target_output.txt', sorted_players)
  end

  def test_import_reads_files_and_returns_an_array_of_players
    assert_instance_of Player, players.first
  end

  def test_player_from_comma_file_is_created_with_correct_attributes
    player = players.first
    attributes = {:last_name=>"Abercrombie", :first_name=>"Neil", :gender=>"Male", :date_of_birth=>"2/13/1943", :favorite_color=>"Tan"}

    assert_equal attributes, player.attributes
  end

  def test_player_from_pipe_file_is_created_with_correct_attributes
    player = players[3]
    attributes = {:last_name=>"Smith", :first_name=>"Steve", :gender=>"Male", :date_of_birth=>"3/3/1985", :favorite_color=>"Red"}

    assert_equal attributes, player.attributes
  end

  def test_player_from_space_file_is_created_with_correct_attributes
    player = players[6]
    attributes = {:last_name=>"Kournikova", :first_name=>"Anna", :gender=>"Female", :date_of_birth=>"6/3/1975", :favorite_color=>"Red"}

    assert_equal attributes, player.attributes
  end

  def test_export_method_writes_a_new_txt_file_with_correct_output
    output_file = IO.readlines('./test/output/target_output.txt')
    assert_equal 'Output 1:', output_file[0].strip
    assert_equal 'Hingis Martina Female 4/2/1979 Green', output_file[1].strip
    assert_equal 'Kelly Sue Female 7/12/1959 Pink', output_file[2].strip
    assert_equal 'Kournikova Anna Female 6/3/1975 Red', output_file[3].strip
    assert_equal 'Seles Monica Female 12/2/1973 Black', output_file[4].strip
    assert_equal 'Abercrombie Neil Male 2/13/1943 Tan', output_file[5].strip
    assert_equal 'Bishop Timothy Male 4/23/1967 Yellow', output_file[6].strip
    assert_equal 'Bonk Radek Male 6/3/1975 Green', output_file[7].strip
    assert_equal 'Bouillon Francis Male 6/3/1975 Blue', output_file[8].strip
    assert_equal 'Smith Steve Male 3/3/1985 Red', output_file[9].strip
    assert_equal 'Output 2:', output_file[11].strip
    assert_equal 'Abercrombie Neil Male 2/13/1943 Tan', output_file[12].strip
    assert_equal 'Kelly Sue Female 7/12/1959 Pink', output_file[13].strip
    assert_equal 'Bishop Timothy Male 4/23/1967 Yellow', output_file[14].strip
    assert_equal 'Seles Monica Female 12/2/1973 Black', output_file[15].strip
    assert_equal 'Bonk Radek Male 6/3/1975 Green', output_file[16].strip
    assert_equal 'Bouillon Francis Male 6/3/1975 Blue', output_file[17].strip
    assert_equal 'Kournikova Anna Female 6/3/1975 Red', output_file[18].strip
    assert_equal 'Hingis Martina Female 4/2/1979 Green', output_file[19].strip
    assert_equal 'Smith Steve Male 3/3/1985 Red', output_file[20].strip
    assert_equal 'Output 3:', output_file[22].strip
    assert_equal 'Smith Steve Male 3/3/1985 Red', output_file[23].strip
    assert_equal 'Seles Monica Female 12/2/1973 Black', output_file[24].strip
    assert_equal 'Kournikova Anna Female 6/3/1975 Red', output_file[25].strip
    assert_equal 'Kelly Sue Female 7/12/1959 Pink', output_file[26].strip
    assert_equal 'Hingis Martina Female 4/2/1979 Green', output_file[27].strip
    assert_equal 'Bouillon Francis Male 6/3/1975 Blue', output_file[28].strip
    assert_equal 'Bonk Radek Male 6/3/1975 Green', output_file[29].strip
    assert_equal 'Bishop Timothy Male 4/23/1967 Yellow', output_file[30].strip
    assert_equal 'Abercrombie Neil Male 2/13/1943 Tan', output_file[31].strip
  end

end
