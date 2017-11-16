require './test/test_helper'

class SortedPlayerCollectionTest < Minitest::Test
  attr_reader :players

  def setup
    player_data = [
                Player.new("Abercrombie, Neil, Male, Tan, 2/13/1943"),
                Player.new("Bishop, Timothy, Male, Yellow, 4/23/1967"),
                Player.new("Kelly, Sue, Female, Pink, 7/12/1959"),
                Player.new("Smith | Steve | D | M | Red | 3-3-1985"),
                Player.new("Bonk | Radek | S | M | Green | 6-3-1975"),
                Player.new("Bouillon | Francis | G | M | Blue | 6-3-1975"),
                Player.new("Kournikova Anna F F 6-3-1975 Red"),
                Player.new("Hingis Martina M F 4-2-1979 Green"),
                Player.new("Seles Monica H F 12-2-1973 Black"),
              ]
    @players = SortedPlayerCollection.sort_players(player_data)
  end

  def test_first_person_is_female_when_sorting_by_gender
    sorted_by_gender = players[0]
    assert_equal 'Female', sorted_by_gender[0].attributes[:gender]
  end

  def test_last_person_is_male_when_sorting_by_gender
    sorted_by_gender = players[0]
    assert_equal 'Male', sorted_by_gender[8].attributes[:gender]
  end

  def test_first_person_is_older_than_last_person_when_sorting_by_date_of_birth
    sorted_by_birth = players[1]
    oldest_age = Date.strptime(sorted_by_birth[0].attributes[:date_of_birth], '%m/%d/%Y')
    youngest_age = Date.strptime(sorted_by_birth[8].attributes[:date_of_birth], '%m/%d/%Y')
    assert_equal true, youngest_age > oldest_age
  end

  def test_first_persons_last_name_comes_first_in_alphabet_when_sorting_by_last_name_descending
    sorted_by_last_name = players[2]
    first_letter_of_last_name_for_first_player = sorted_by_last_name[0].attributes[:last_name][0]
    first_letter_of_last_name_for_last_player = sorted_by_last_name[8].attributes[:last_name][0]
    assert_equal true, first_letter_of_last_name_for_first_player > first_letter_of_last_name_for_last_player
  end

end
