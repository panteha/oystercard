class Oystercard
  attr_accessor :balance, :entry_station, :list_of_journey, :exit_station
  MAXIMUM_BALANCE = 90


  def initialize()
    @balance = 0
    @in_journey = false
    @entry_station = []
    @exit_station = []
    @list_of_journey = {}
  end

  def top_up(amount)
      raise "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + amount > MAXIMUM_BALANCE
      @balance = @balance + amount
  end

  def deduct(amount)
  	@balance -= amount
  end

  def in_journey?
    !!@entry_station
  end

  def tap_in(entry_station)
    raise "Not enough funds" if @balance < 1
      @entry_station << entry_station
  end

  def tap_out(exit_station)
    #deduct(amount)
    @exit_station << exit_station
  end

  def list
  #new_hash = (@entry_station.zip(@exit_station)).to_h
  @list_of_journey = (@entry_station.zip(@exit_station)).to_h
  end

end
