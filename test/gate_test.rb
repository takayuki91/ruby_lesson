require "minitest/autorun"
require_relative "../lib/gate"
require_relative "../lib/ticket"


class GateTest < Minitest::Test
  
  # テストメソッドが実行される前にこのメソッドが毎回呼ばれる
  def setup
    @umeda = Gate.new(:umeda)
    @juso = Gate.new(:juso)
    @mikuni = Gate.new(:mikuni)
  end
  
  def test_umeda_to_juso
    ticket = Ticket.new(160)
    @umeda.enter(ticket)
    assert @juso.exit(ticket) #まだ通っていない
  end

  def test_umeda_to_mikuni_when_fare_is_not_enough
    ticket = Ticket.new(160)
    @umeda.enter(ticket)
    refute @mikuni.exit(ticket)
  end

end