puts "Bonjour, quelle est ton âge ?"
print "> "
age = gets.chomp.to_i
for year in 0..age 
    puts "Il y a #{age} ans, tu avais #{year} ans"
    age -= 1
end