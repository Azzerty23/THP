def signup
    puts "Enregistre un nouveau mot de passe (tâche de t'en souvenir) :"
    print "> "
    pwd = gets.chomp
    while pwd == "" do 
        puts "Renseigne un mot de passe valide"
        print "> "
        pwd = gets.chomp
    end
    return pwd
end

def login(pwd)
    puts "Renseigne ton mot de passe :"
    print "> "
    input = gets.chomp
    while input != pwd
        puts "Mauvais mot de passe. Recommence :"
        print "> "
        input = gets.chomp
    end
end

def welcome_screen
    puts "Bienvenue dans la zone secrète"
    puts "TOP SECRET :" 
    puts "Pour optimiser la pluralité corporate, la réponse est simple : incentiver les potentiels mobilité."
end

def perform
    login(pwd = signup)
    welcome_screen
end

perform