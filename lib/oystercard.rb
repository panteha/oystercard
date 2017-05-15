class Oystercard
  attr_reader :balance

  def initialize()
    @balance = 0
  end

  def top_up(amount)
     @balance = @balance + amount
      raise "Balance exceeds £90" if @balance > 90
  end


end
