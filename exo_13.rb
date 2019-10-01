puts "Bonjour, quelle est ton année de naissance ?"
print "> "
birthday_year = gets.chomp.to_i
for i in birthday_year..2019 do
    puts i
end
