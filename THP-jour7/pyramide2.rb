puts "Salut, bienvenue dans ma super pyramide ! Combien d'étages veux-tu ?"
print "> "
step = gets.chomp.to_i
puts "Voici la pyramide :"
i = 1
while i <= step
    puts '#'*i
    i += 1
end