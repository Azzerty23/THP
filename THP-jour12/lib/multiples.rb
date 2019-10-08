def is_multiple_of_3_or_5?(current_number)
  return current_number%3 == 0 || current_number%5 == 0
end

def sum_of_3_or_5_multiples(final_number)
  if !final_number.is_a?(Integer) || final_number < 0
    return "Yo ! Je ne prends que les entiers naturels. TG"
  else
    return (0...final_number).inject(0) { |sum, current_number| is_multiple_of_3_or_5?(current_number) ? sum + current_number : sum }
  end
end


print sum_of_3_or_5_multiples(10)

# print [1,2,3].inject(:+)