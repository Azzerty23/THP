puts "Compte à rebours"
puts "Donne moi un nombre"
print "> "
number = gets.chomp.to_i
while number >= 0
    puts number
    number -= 1
end