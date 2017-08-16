gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'credit_check'

class CardCheckerTest < Minitest::Test
  def test_it_reverses_card_number
    card_number = CardChecker.new("4929735477250543")
    assert_equal ["3", "4", "5", "0", "5", "2", "7", "7", "4", "5", "3", "7", "9", "2", "9", "4"], card_number.reverse_card_number
  end

  def test_it_doubles_every_second_digit
    card_number = CardChecker.new("4929735477250543")
    card_number.reverse_card_number
    assert_equal ["3", "8", "5", "0", "5", "4", "7", "5", "4", "1", "3", "5", "9", "4", "9", "8"], card_number.make_doubles
  end

  def test_it_sums_digits
    card_number = CardChecker.new("4929735477250543")
    card_number.reverse_card_number
    card_number.make_doubles
    assert_equal 80, card_number.sum_digits
  end

  def test_it_checks_card_number
    card_number = CardChecker.new("4929735477250543")
    assert_equal "The number is valid!", card_number.check_card
  end
end
