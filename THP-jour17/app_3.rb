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

# Comme pour app_2 le jeu commence sur décision du joueur selon sa saisie
input = nil
until input == "\n"
  input = gets
  if input.chomp == ' '
    puts "Bye !"
    exit
  end
end
puts "Nom du joueur : "
print "> "
player_name = gets.chomp # Je récupère le nom du joueur
puts "Combien d'ennemies es-tu prêt à affronter ? : "
print "> "
begin                           
  players_left = Integer(gets)  # Je vérifie que l'utisateur renseigne un Integer
rescue ArgumentError            # sinon je prévois un nombre de 10 ennemies par défaut
  puts "On va partir sur 10 ennemies..."
  players_left = 10
end
puts "Ils arriveront au fur et à mesure de la partie !"
my_game = Game.new(player_name, players_left) # Création d'une instance de Game
puts "Durant la partie, souviens-toi de cette phrase :"
puts "Dans la lignée d'une flexibilité accélérationnelle, il faut imaginer les produits risques."
print "\n"
puts "Bon courage !"

while my_game.is_still_ongoing? # On boucle tant que le joueur et un bot est encore en vie via un appel de méthode prévue à cet effet
  print "\n"
  my_game.count_turns # On récupère le nombre de tours et on l'affiche en début de nouveau tour : nouvel attribut @turns (pas demandé)
  print "\n"
  my_game.show_players # On montre l'état du joueur et le nombre de joeurs encore en vie
  print "\n"
  my_game.new_players_in_sight # On annonce le nombre de nouveaux ennemies en vue
  my_game.menu        # On affiche les options pour le joueur
  my_game.menu_choice(gets.chomp) # Exécution de l'option choisie 
  print "\n"
  my_game.enemies_attack # Attaque des différents ennemies
end

print "\n"
my_game.end # Annonce de la fin du jeu