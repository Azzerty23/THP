def say_hello
  puts "Bonjour !"
end

def ask_first_name
  puts "Quel est ton prenom ?"
  print "> "
  first_name = gets.chomp
  return first_name
end

def greet(first_name)
  return "Bonjour #{first_name}"
end

def ask_last_name
  puts "Et quel est ton nom de famille ?"
  print "> "
  last_name = gets.chomp
  return last_name
end

def greet2(first_name, last_name)
  return "Et bien le bonjour #{first_name} #{last_name}"
end

puts say_hello
my_first_name = ask_first_name
puts greet(my_first_name)
my_last_name = ask_last_name
puts greet2(my_first_name, my_last_name)