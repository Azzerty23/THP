def caesar_cipher(message, key=5)
  
  unless message.is_a?(String) && key.is_a?(Integer)
    return "The message must be a String and the key an Integer"
  end
  
  encoded_message = []
  letters = message.split("")
  
  letters.each do |letter|  
      letter_ascii = letter.downcase.ord
      encoded_letter = letter_ascii + key
      if letter.match?(/\s/)
        encoded_letter = letter
      elsif encoded_letter > ("z".ord - key)
        encoded_letter -= 26
      end
      if letter.match?(/[[:upper:]]/)
        encoded_message << encoded_letter.chr.upcase
      else
        encoded_message << encoded_letter.chr
      end
    end
  return encoded_message.join("")
end

print caesar_cipher("helLo you")
print caesar_cipher("Z", 1)