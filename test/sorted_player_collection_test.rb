require './test/test_helper'

class SortedPlayerCollectionTest < Minitest::Test
  attr_reader :players

  def setup
    player_data = [
                Player.new('Abercrombie, Neil, Male, Tan, 2/13/1943'),
                Player.new('Seles Monica H F 12-2-1973 Black'),
                Player.new("Smith | Steve | D | M | Red | 3-3-1985")
              ]
    @players = SortedPlayerCollection.sort_players(player_data)
  end

  def test_first_person_is_female_when_sorting_by_gender
    sorted_by_gender = players[0]

    assert_equal 'Female', sorted_by_gender[0].attributes[:gender]
  end

  def test_last_person_is_male_when_sorting_by_gender
    sorted_by_gender = players[0]

    assert_equal 'Male', sorted_by_gender[2].attributes[:gender]
  end

  def test_first_person_is_older_than_last_person_when_sorting_by_date_of_birth
    sorted_by_birth = players[1]

    assert_equal '2/13/1943', sorted_by_birth[0].attributes[:date_of_birth]
  end

  def test_last_person_is_younger_than_first_person_when_sorting_by_date_of_birth
    sorted_by_birth = players[1]

    assert_equal '3/3/1985', sorted_by_birth[2].attributes[:date_of_birth]
  end

  def test_first_persons_last_name_comes_first_in_alphabet_when_sorting_by_last_name_descending
    sorted_by_last_name = players[2]

    assert_equal 'Smith', sorted_by_last_name[0].attributes[:last_name]
  end

  def test_last_persons_last_name_comes_last_in_alphabet_when_sorting_by_last_name_descending
    sorted_by_last_name = players[2]

    assert_equal 'Abercrombie', sorted_by_last_name[2].attributes[:last_name]
  end

end
