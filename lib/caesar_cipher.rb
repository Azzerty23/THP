def encoder()
  encoded_message = []
  letters = message.split("")
  letters.each do |letter|
    if letter.is_a?(String) && key.is_a?(Integer)
      letter_ascii = letter.downcase.ord
      encoded_letter = letter_ascii + key
      if /\s/.match?(letter)
        encoded_letter = letter
      elsif encoded_letter > ("z".ord - key)
        encoded_letter -= 25
      end
      encoded_message << encoded_letter
    else
      return "The message must be a String and the key an Integer"
    end
  end

  return encoded_message.join(" ")
end

def decoder()

end

def caesar_cipher(message, key=5)


end

print caesar_cipher("hello you")

puts "a".ord
puts "z".ord

# print /\s/.match?("qsdf")