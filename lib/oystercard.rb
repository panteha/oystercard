class Oystercard
  attr_accessor :balance, :entry_station
  MAXIMUM_BALANCE = 90

  def initialize()
    @balance = 0
    @in_journey = false
    @entry_station = nil
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
      @entry_station = entry_station
  end

  def tap_out
    @in_journey = false
  end

  # def entry_station(entry_station)
  #     @entry_station = entry_station
  # end


end
