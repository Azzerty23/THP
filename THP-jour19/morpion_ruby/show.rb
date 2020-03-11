class Show

	def welcome
		puts
		puts "    #================================#"
		puts "    |         Hello, world !         |"
		puts "    |     Welcome to Tic-Tac-Toe     |"
		puts "    |           RUBY V1.94           |"
		puts "    #================================#"
		puts
		gets.chomp
	end

	def show_board(board)
		#TO DO : affiche sur le terminal l'objet de classe Board en entrée. S'active avec un Show.new.show_board(instance_de_Board)
		white5 = "     ".colorize(:background => :white)
		white2 = "  ".colorize(:background => :white)
		white1 = " ".colorize(:background => :white)
		#{board.boardcase_array[0].value != ' ' ? board.boardcase_array[0].value : white1}
		puts
		puts "        A     B     C     "
		puts "     #=================#"
		puts "     |#{white5}|#{white5}|#{white5}|"
		puts "   1 |#{white2}#{board.boardcase_array[0].value != ' ' ? board.boardcase_array[0].value : white1}#{white2}|#{white2}#{board.boardcase_array[1].value != ' ' ? board.boardcase_array[1].value : white1}#{white2}|#{white2}#{board.boardcase_array[2].value != ' ' ? board.boardcase_array[2].value : white1}#{white2}|"
		puts "     |#{white5}|#{white5}|#{white5}|"
		puts "     #=================#"
		puts "     |#{white5}|#{white5}|#{white5}|"
		puts "   2 |#{white2}#{board.boardcase_array[3].value != ' ' ? board.boardcase_array[3].value : white1}#{white2}|#{white2}#{board.boardcase_array[4].value != ' ' ? board.boardcase_array[4].value : white1}#{white2}|#{white2}#{board.boardcase_array[5].value != ' ' ? board.boardcase_array[5].value : white1}#{white2}|"
		puts "     |#{white5}|#{white5}|#{white5}|"
		puts "     #=================#"
		puts "     |#{white5}|#{white5}|#{white5}|"
		puts "   3 |#{white2}#{board.boardcase_array[6].value != ' ' ? board.boardcase_array[6].value : white1}#{white2}|#{white2}#{board.boardcase_array[7].value != ' ' ? board.boardcase_array[7].value : white1}#{white2}|#{white2}#{board.boardcase_array[8].value != ' ' ? board.boardcase_array[8].value : white1}#{white2}|"
		puts "     |#{white5}|#{white5}|#{white5}|"
		puts "     #=================#"
		puts

	end

end