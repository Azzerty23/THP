puts "Salut, bienvenue dans ma super pyramide ! Combien d'étages veux-tu ?"
print "> "
step = gets.chomp.to_i
puts "Voici la pyramide :"

blank = 0
for i in 1..step do
    blank = step - i
    puts "#{' '*blank}#{'#'*i}"
end