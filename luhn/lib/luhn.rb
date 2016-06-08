module Luhn

  def self.digitize_credit_card_number(number)
    number.to_s.chars.map(&:to_i)
  end

  def self.double_every_second_digit_from_right(digits)
    digits.reverse.map.with_index do |digit, index|
      index.odd? ? digit *= 2 : digit
    end
  end

  def self.greater_than_9_subtract_9(doubled_digits)
    doubled_digits.map.with_index do |digit, index|
      digit > 9 ? digit -= 9 : digit
    end
  end

  def self.sum_digits(digits)
    digits.reduce(&:+)
  end

  def self.divisible_by_10?(sum)
    sum % 10 == 0
  end

  def self.is_valid?(number)
    divisible_by_10?(
      sum_digits(
        greater_than_9_subtract_9(
          double_every_second_digit_from_right(
            digitize_credit_card_number(number)
    ))))
  end

end
