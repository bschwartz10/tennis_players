require './test/test_helper'

class OrdersWriterTest < Minitest::Test
  # WIP
  def setup
    players = [
      [Player.new(["Abercrombie", "Neil", "Male", "2/13/1943", "Tan"]),
      Player.new(["Smith", "Steve", "Male", "3/3/1985", "Red"]),
      Player.new(["Kournikova", "Anna", "Female", "6/3/1975", "Red"])],
    ]
    PlayersWriter.export(players)
  end

  def test_orders_writer_exists
    assert_kind_of Class, PlayersWriter
  end

  def test_write_orders_method_writes_a_new_csv_file_with_correct_output
  # WIP
    actual_csv = IO.readlines('./output/target_output.txt')
    first_line = actual_csv[0].strip
    second_line = actual_csv[1].strip
    third_line = actual_csv[2].strip
    fourth_line = actual_csv[3].strip
    assert_equal 'Output 1:', first_line
    assert_equal 'Abercrombie Neil Male 2/13/1943 Tan', second_line
    assert_equal 'Smith Steve Male 3/3/1985 Red', third_line
    assert_equal 'Kournikova Anna Female 6/3/1975 Red', fourth_line
  end
end
