class CardChecker

  def validate(card_number)
    if card_number.valid?
      p "The number is valid!"
    else
      p "The number is invalid!"
    end
  end

  def valid?(number)
    formatted = format_input(number)
    doubled = format_odd_digits(formatted)
    sum = doubled.sum
    sum % 10 == 0
  end

  def format_input(number)
    number.to_i.digits
  end

  def format_odd_digits(number)
    number.map.with_index do |digit, index|
      digit = sum_double_digits(digit *= 2) if index.odd?
      digit
    end
  end

  def sum_double_digits(number)
    number.digits.sum if number > 9
    number
  end

end
