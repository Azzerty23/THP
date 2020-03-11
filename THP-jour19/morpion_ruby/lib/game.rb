class Game
  #TO DO : la classe a plusieurs attr_accessor: le current_player (égal à un objet Player), le status (en cours, nul ou un objet Player s'il gagne), le Board et un array contenant les 2 joueurs.
  attr_accessor :current_player, :board, :players_array
  @@count = 0

  def initialize
    #TO DO : créé 2 joueurs, créé un board, met le status à "on going", défini un current_player
    @players_array = []
    values = ["X".colorize(:color => :red, :background => :white), "O".colorize(:color => :blue, :background => :white)]
    2.times do |i|
      @players_array << Player.new(name = "Player #{i+1}", value=values[i])
    end
    @current_player = @players_array[1]
    @board = Board.new
    @@count += 1
  end

  def turn
    #TO DO : méthode faisant appelle aux méthodes des autres classes (notamment à l'instance de Board). Elle affiche le plateau, demande au joueur ce qu'il joue, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie.
    if @current_player == players_array[0]
      @current_player = players_array[1]
    else
      @current_player = players_array[0]
    end
    play_turn(@current_player)
  end

  def play_turn(current_player)
    #TO DO : une méthode qui :
    #1) demande au bon joueur ce qu'il souhaite faire
    #2) change la boardCase jouée en fonction de la valeur du joueur (X ou O)

    puts "C'est au tour de #{current_player.name} : #{current_player.value}"
    puts "Dans quelle case souhaites-tu jouer ?"
    print "> "
    choice = gets.chomp.upcase # TODO : faire un dic de correspondance
    case choice
    when "A1"
      choice = 0
    when "B1"
      choice = 1
    when "C1"
      choice = 2
    when "A2"
      choice = 3
    when "B2" 
      choice = 4
    when "C2"
      choice = 5
    when "A3"
      choice = 6
    when "B3"
      choice = 7
    when "C3"
      choice = 8
    else
      choice = 4
    end
    @board.boardcase_array[choice].value = current_player.value
  end

  def victory?
    #TO DO : une méthode qui vérifie le plateau et indique s'il y a un vainqueur ou match nul
    @players_array.each do |player|
      if (@board.boardcase_array[0].value == player.value && @board.boardcase_array[1].value == player.value && @board.boardcase_array[2].value == player.value) ||
      (@board.boardcase_array[3].value == player.value && @board.boardcase_array[4].value == player.value && @board.boardcase_array[5].value == player.value) ||
      (@board.boardcase_array[6].value == player.value && @board.boardcase_array[7].value == player.value && @board.boardcase_array[8].value == player.value) ||
      (@board.boardcase_array[0].value == player.value && @board.boardcase_array[3].value == player.value && @board.boardcase_array[6].value == player.value) ||
      (@board.boardcase_array[1].value == player.value && @board.boardcase_array[4].value == player.value && @board.boardcase_array[7].value == player.value) ||
      (@board.boardcase_array[2].value == player.value && @board.boardcase_array[5].value == player.value && @board.boardcase_array[8].value == player.value) ||
      (@board.boardcase_array[0].value == player.value && @board.boardcase_array[4].value == player.value && @board.boardcase_array[8].value == player.value) ||
      (@board.boardcase_array[2].value == player.value && @board.boardcase_array[4].value == player.value && @board.boardcase_array[6].value == player.value)
        return true
      end
    end
  end

  def tie?
    @board.boardcase_array.all? { |boardcase| boardcase.value != ' '}
  end

  def new_round
    # TO DO : relance une partie en initialisant un nouveau board mais en gardant les mêmes joueurs.
    puts "Voulez-vous faire une nouvelle partie ?"
    puts "Tapez Entrée pour valider ou Exit pour quitter"
    input = gets
    if input == "\n"
      puts "Nouvelle partie lancée !"
      sleep 1.5
      Application.perform
    else
      puts "Bye !"
      exit
    end

  end

  def game_end
    # TO DO : permet l'affichage de fin de partie quand un vainqueur est détecté ou si il y a match nul
    if victory? == true
      puts "Victoire de #{@current_player.name} !\n\n"
    else
      puts "Match nul !"
    end   
  end

end
