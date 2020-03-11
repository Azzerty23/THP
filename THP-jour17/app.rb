require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# Initialisation des instances de classe Player
player1 = Player.new("Josiane")
player2 = Player.new("José")

# On boucle tant que les deux joueurs sont en vie
while player1.life_points > 0 && player2.life_points > 0
  puts "> Voici l'état de chaque joueur :"
  puts player1.show_state
  puts player2.show_state
  puts "\n"
  puts "> Passons à la phase d'attaque :"
  player1.attacks(player2)
  if player2.life_points <= 0 # Si le joueur attaqué n'a pas de points de vie on sort de la 
    break                     # boucle pour qu'il ne réattaque pas tel un zombie
  end
  player2.attacks(player1)
  puts "\n"
end
