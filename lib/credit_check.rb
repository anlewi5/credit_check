# Your Luhn Algorithm Here

class CardChecker

  #attr_reader :card_number

  def initialize(card_number)
    @card_number = card_number
  end

#Returns an array of strings representing digits in reverse order
  def reverse_card_number
    @reversed_card = @card_number.to_s.reverse.each_char.to_a
  end

  def convert_digit(digit)
    if digit.to_i >= 10
      digit = digit[0].to_i + digit[1].to_i
      digit = digit.to_s
      return digit
    else
      return digit
    end
  end

  #Returns string array with odd indices doubled
  def make_doubles
      @doubled_card =
        @reversed_card.map.with_index do |digit, index|
          if index.odd?
            digit = (digit.to_i * 2).to_s
            convert_digit(digit)
          else
            digit
          end
        end
  end

  def sum_digits
    @card_sum = 0
    @doubled_card.each do |digit|
      @card_sum += digit.to_i
    end
    @card_sum
  end

  def check_sum
    if @card_sum % 10 === 0
      "The number is valid!"
    else
      "The number is invalid!"
    end
  end

  def check_card
    reverse_card_number
    make_doubles
    sum_digits
    check_sum
  end
end

# notes for potential improvement:
#for convert_digit method: .divmod(10), -=9 is same as adding the 2 digits together
#for check_sum method: .zero?
