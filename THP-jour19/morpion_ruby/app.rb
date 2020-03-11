system "Bundler install --quiet"
require 'bundler'
Bundler.require

$:.unshift File.expand_path('./../lib/', __FILE__)
require 'board'
require 'boardcase'
require 'game'
require 'player'
require 'colorize'
require_relative 'show'


class Application

  def self.perform
    # TO DO : méthode qui initialise le jeu puis contient des boucles while pour faire tourner le jeu tant que la partie n'est pas terminée.
    game = Game.new
    show = Show.new
    system("clear")
    until game.victory? == true or game.tie? == true
      system("clear")
      puts "       ### Partie #{Game.class_variable_get(:@@count)} ###"
      show.show_board(game.board)
      game.turn
    end
    system("clear")
    show.show_board(game.board)
    game.game_end
    game.new_round
  end

end
show = Show.new
show.welcome
Application.perform