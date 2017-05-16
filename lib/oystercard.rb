class Oystercard
  attr_accessor :balance,  :list_of_journeys
  attr_reader :entry_station
  MAXIMUM_BALANCE = 90
  MINIMUM_CHARGE = 1


  def initialize()
    @balance = 0
    @in_journey = false
    @entry_station = nil
    @list_of_journeys = []
  end

  def top_up(amount)
      raise "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + amount > MAXIMUM_BALANCE
      @balance = @balance + amount
  end

  def deduct(amount)
  	@balance -= amount
  end

  def in_journey?
    @in_journey
    # if @entry_station == []
    #   @entry_station = false
    # else
    #   !!@entry_station
    # end
  end

  def tap_in(entry_station)
    raise "Not enough funds" if @balance < 1
        @entry_station = entry_station
        @in_journey = true
  end


  def tap_out(exit_station)
      deduct(MINIMUM_CHARGE)
      @in_journey = false
      @list_of_journeys << { @entry_station => exit_station}
  end

  # def list
  # #new_hash = (@entry_station.zip(@exit_station)).to_h
  # @list_of_journey = (@entry_station.zip(@exit_station)).to_h
  # end

end
