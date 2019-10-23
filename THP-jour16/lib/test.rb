require "pry"

class User
  attr_accessor :firstname
  attr_writer :mastercard
  attr_reader :birthday
  attr_accessor :address
  @@user_count = 0

  def initialize(firstname)
    @firstname = firstname
    say_hello_to_someone(self.firstname)
    puts "Bienvenue !"
    @@user_count += 1
    return @@user_count
  end

  def self.count
    @@user_count
  end

  def greet
    puts "Bonjour, monde !"
  end

  def say_hello_to_someone(firstname)
    puts "Bonjour, #{firstname} !"
  end

  def show_itself
    print "Voici l'instance : "
    puts self
  end

  def update_email(email_to_update)
    @email = email_to_update
  end

  def read_email
    return @email
  end

  def read_mastercard
    return @mastercard
  end

  def update_birthday(birthday)
    @birthday = birthday
  end

end #fin de ma classe

binding.pry
puts "end of file"