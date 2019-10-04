puts "Dis-moi jusqu'à combien tu veux que je compte ;)"
puts "Entre un nombre :"
print "> "
number = gets.chomp.to_i
number.times do |i|
    puts i+1
end