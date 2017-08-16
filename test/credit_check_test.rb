gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/credit_check'

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

    card_number = CardChecker.new("5541808923795240")
    assert_equal "The number is valid!", card_number.check_card

    card_number = CardChecker.new("4024007136512380")
    assert_equal "The number is valid!", card_number.check_card

    card_number = CardChecker.new("6011797668867828")
    assert_equal "The number is valid!", card_number.check_card

    card_number = CardChecker.new("5541801923795240")
    assert_equal "The number is invalid!", card_number.check_card

    card_number = CardChecker.new("024007106512380")
    assert_equal "The number is invalid!", card_number.check_card

    card_number = CardChecker.new("6011797668868728")
    assert_equal "The number is invalid!", card_number.check_card
  end
end
