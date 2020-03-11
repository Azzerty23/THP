class Player
  attr_accessor :name, :life_points # attributs accessibles en dehors de la classe en lecture et écriture

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    "#{@name} a #{@life_points} point#{'s' if @life_points > 1} de vie"
  end

  def gets_damage(damage_points)
    @life_points -= damage_points # On soustrait les points de dommage à @life_points
    if @life_points <= 0
      puts "Le joueur #{@name} a été tué !"
      @life_points = 0
    end
  end

  def attacks(other_player)
    begin
      puts "#{@name} attaque #{other_player.name}"
      damage = compute_damage
      puts "Il lui inflige #{damage} point#{'s' if damage > 1} de dommages"
      other_player.gets_damage(damage)
    rescue NoMethodError
      puts "Tu pensais attaquer qui en faisant ça ?"
    end
  end

  def compute_damage
    return rand(1..6)
  end

end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    super name # Je récupère le @name via l'initialize de la classe Player
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    "Tu as #{@life_points} point#{'s' if @life_points > 1} de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    super * @weapon_level # le compute_damage se base sur le calcul héritée de la classe parente multiplié par le niveau de l'arme
  end

  def search_weapon
    new_weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
    if new_weapon_level > @weapon_level
      @weapon_level = new_weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    health_pack = rand(1..6)
    if health_pack == 1
      puts "Tu n'as rien trouvé..."
    elsif health_pack > 1 && health_pack < 6
      @life_points += 50
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    else 
      @life_points += 80
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end
    if @life_points > 100
      @life_points = 100
    end
  end

end