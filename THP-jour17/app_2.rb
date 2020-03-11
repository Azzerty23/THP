require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "-------------------------------------------------"
puts "|                                               |"
puts "|           ILS VEULENT TOUS MA POO !           |"
puts "|           *************************           |"
puts "|          Soit le dernier survivant !!         |"
puts "|                                               |"
puts "| Démarrer une nouvelle partie : press Enter    |"
puts "| Quitter : press Space + Enter                 |"
puts "|                                               |"
puts "| *Jeu déconseillé aux -18 ans                  |"
puts "-------------------------------------------------"

# On boucle jusqu'à ce que l'utilisateur démarre le jeu ou quitte directement 
# selon les instructions donné au début
input = nil
until input == "\n"
  input = gets
  if input.chomp == ' '
    exit
  end
end
puts "Nom du joueur : "
print "> "
player_name = gets.chomp
human_player = HumanPlayer.new(player_name) # Initialisation du joueur avec son nom reseigné par lui-même
player1 = Player.new('Josiane')
player2 = Player.new('José')
enemies = [player1, player2] # Les deux bots instanciés sont ajoutés dans l'array
print "\n"

# On boucle tant que le joueur et un des bots a encore des points de vie
while human_player.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  puts "> Voici ton état :"
  puts human_player.show_state
  print "\n"

  puts "> Quelle action veux-tu effectuer ?"
  print "\n"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  print "\n"
  puts "attaquer un joueur en vue :"
  puts "0 - #{player1.show_state}"
  puts "1 - #{player2.show_state}"
  print "\n"
  
  input = ""
  # On boucle jusqu'à ce que l'utilisateur saisisse une entrée valide
  until input.chomp == 'a' || input.chomp == 's' || input.chomp == '0' || input.chomp == '1'
    input = gets
  # On exécute la méthode/option choisie selon le voeu de l'utilisateur
    case input.chomp 
    when 'a'
      human_player.search_weapon
    when 's'
      human_player.search_health_pack
    when '0'
      if player1.life_points <= 0 # Si l'utlisateur attaque un bot qui n'a déjà plus de vie, on l'en informe gentiment
        puts "Cet ennemi est déjà mort ! Tu t'acharnes ?"
        puts "Tant pis pour toi tu perds un tour !"
      else 
        human_player.attacks(player1) 
      end
    when '1' # Idem que pour '0' avec le player2
      if player2.life_points <= 0
        puts "Cet ennemi est déjà mort ! Tu t'acharnes ?"
        puts "Tant pis pour toi tu perds un tour !"
      else
        human_player.attacks(player2)
      end
    when ' '
      exit # On laisse à l'utilisateur la possiblité de quitter la partie en cours de route
    end
  end

  number_alive = 0
  enemies.each do |enemie| # On récupère chacune des instances de la classe Player
    if enemie.life_points > 0 # Seuls les bots encore en vie peuvent attaquer
      number_alive += 1
      if number_alive == 1
        puts "Les autres joueurs t'attaquent !"
      end
      enemie.attacks(human_player)
    end
  end

# Comme au début de la partie on permet à l'utilisateur de passer à la suite selon sa saisie
  puts "Press Enter to continue"
  input = ""
  until input == "\n"
    input = gets
    if input.chomp == ' '
      exit
    end
  end

end

# Une fois que le joueur ou les deux bots n'ont plus de point de vie, on annonce le résulat
puts "La partie est finie" 
if human_player.life_points > 0 
  puts "BRAVO ! TU AS GAGNE !" 
else
  puts "Loser ! Tu as perdu !"
end
