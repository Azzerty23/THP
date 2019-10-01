puts "Salut, bienvenue dans ma super pyramide ! Combien d'étages veux-tu ?"
print "> "
step = gets.chomp.to_i
puts "Voici la pyramide :"

blank = 0
i = 1
while i <= step
    blank = step - i
    puts "#{' '*blank}#{'#'*i}"
    i += 1
end