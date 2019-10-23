class User
  attr_accessor :email, :age
  @@all = []

  def initialize(email, age)
    @email = email
    @age = age
    @@all << self
  end

  def self.all
    return @@all
  end

  def self.find_by_email(email)
    for user in @@all
      if email==user.email
        puts "Voici l'âge du User trouvé : #{self.age}"
      end
    end
  end

end