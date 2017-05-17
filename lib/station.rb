
class Station
  attr_reader :name, :zone

  def initialize(name = :Aldgate_East, zone = 1)
    @name = name
    @zone = zone
  end

end