class Player
  attr_reader :attributes

  def initialize(player)
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
