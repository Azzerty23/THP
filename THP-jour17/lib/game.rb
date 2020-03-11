class Game
  attr_accessor :human_player, :enemies_in_sight, :players_left, :turns, :next_player_num # attributs accessibles en dehors de la classe en lecture et écriture
  
  def initialize(player_name="Wolverine", players_left=4)
    @enemies_in_sight = []
    @players_left = players_left
    @turns = 0
    @next_player_num = 1
    if @players_left >= 20
      number_players = 10 # Le nombre de bots maximum en début de partie est fixé à 10
    else
      number_players = @players_left/2 # ou moitié moins que de bots total si moins de 20 bots au total
    end
    number_players.times do
      player = Player.new("player#{@next_player_num}")
      @next_player_num += 1
      @enemies_in_sight << player # J'ajoute les bots créés dans un array, attribut de l'instance de Game
    @human_player = HumanPlayer.new(player_name) # Instanciation du joueur
    end
  end

  def kill_player(player)
    @enemies_in_sight.delete(player) # Suppression d'un bot de mon array
    @players_left -= 1
  end

  def is_still_ongoing?
    @human_player.life_points > 0 && @players_left > 0 # Booléen selon que le joueur et un des bots soient encore en vie
  end

  def show_players
    puts @human_player.show_state
    puts "Il reste #{@players_left} ennemie#{'s' if @players_left > 1} toujours en vie" # L'orthographe c'est important !
  end

  def menu
    puts "> Quelle action veux-tu effectuer ?"
    print "\n"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    print "\n"
    puts "attaquer un joueur en vue :"
    @enemies_in_sight.each_with_index do |enemie, index|
      puts "#{index+1} - #{enemie.show_state}" # L'index commençant à 0, j'ajoute 1 à chaque fois
    end
    print "\n"
  end

  def menu_choice(input)
    print "> "
    begin
      if input == ' '
        puts "Bye !"
        exit
      elsif input == 'a'
        human_player.search_weapon
      elsif input == 's'
        human_player.search_health_pack
      else
        input = Integer(input) - 1 # Je soustrais 1 pour garder la correspondance avec l'index que j'avais augmenté de 1 (question d'affichage)
        human_player.attacks(@enemies_in_sight[input])
        if @enemies_in_sight[input].life_points <= 0
          kill_player(@enemies_in_sight[input])
        end
      end
    rescue ArgumentError # Si le joueur n'a pas renseigné une bonne valeur, cela génère un ArgumentError
      puts "Tu n'as pas voulu choisir... tu perds un tour. Dommage !"
    end
  end

  def enemies_attack
    @enemies_in_sight.each do |enemie|
      if enemie.life_points > 0 && @human_player.life_points > 0 # Si l'ennemie ou le joueur est mort il n'attaque plus
        enemie.attacks(human_player)
      end
    end
  end

  def new_players_in_sight
    if @enemies_in_sight.length == @players_left
      puts "Tous les joueurs sont déjà en vue"
    elsif @turns == 1 # Pour le premier tour, je ne prends que les 10 bots max créés en début de partie, sinon on a une incohérence
      puts "#{@enemies_in_sight.length} #{@enemies_in_sight.length > 1 ? 'nouveaux ennemies' : 'nouvel ennemie'} en vue"
    else
      dice = rand(1..6) # Je prends une valeur aléatoire entre 1 et 6 inclus
      if dice == 1
        puts "Pas de nouvel ennemie en vue"
      elsif dice >= 5 && @enemies_in_sight.length <= @players_left - 2
        2.times do
        # Au lieu de prendre un numéro aléatoire (pas terrible) je prends le numéro du dernier bot 
        # créé dans la liste + 1
          @enemies_in_sight << Player.new("player#{@next_player_num}")
          @next_player_num += 1
        end
        puts "Deux nouveaux ennemies en vue !!"
      elsif @enemies_in_sight.length <= @players_left - 1
        @enemies_in_sight << Player.new("player#{@next_player_num}")
        @next_player_num += 1
        puts "Un nouvel ennemie en vue !"

      end
    end
  end

  def count_turns
    @turns += 1
    puts "================ turn #{@turns} ================"
  end

  def end
    puts "La partie est finie" 
    if human_player.life_points > 0 
      puts "BRAVO ! TU AS GAGNE !" 
    else
      puts "Loser ! Tu as perdu !"
    end
  end

end