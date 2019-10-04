puts "Bonjour, quelle est ton âge ?"
print "> "
age = gets.chomp.to_i
for year in 0..age 
    if year == age
        puts "Il y a #{year} ans, tu avais la moitié de l'âge que tu as aujourd'hui"
    else 
        puts "Il y a #{age} ans, tu avais #{year} ans"
    end
    age -= 1
end