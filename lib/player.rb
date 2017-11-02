class Player
  attr_reader :player, :attributes

  def initialize(player)
    @player = player
    @attributes = Hash[stock_attributes.zip(player)]
  end

  def stock_attributes
    [
      :last_name,
      :first_name,
      :gender,
      :date_of_birth,
      :favorite_color,
    ]
  end

end
