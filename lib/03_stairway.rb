def throw_dice
    puts "Appuyez sur Entrez pour lancer le dé"
    input = gets
    while input != "\n"
        print "Vous devez appuyer sur Entrez pour lancer le dé"
        input = gets
    end
    result = rand(1..6)
    print "Vous avez fait #{result} ! "
    return result
end

def move(result, score)
    if result >= 5
        new_score = score + 1
        puts "Vous avancez d'une marche. Nouveau score : #{new_score}"
    elsif result >= 2
        new_score = score
        puts "Vous ne bougez pas et vous restez à #{new_score}"
    else
        if score > 0
            new_score = score - 1
            puts "Vous reculez d'une marche. Nouveau score : #{new_score}"
        else
            new_score = score
            puts "Vous ne pouvez pas être plus mauvais. Vous restez à 0."
        end
    end
    return new_score
end

def win(nb_throw)
    puts "\n -----------------------------------------------------------------"
    puts "\n    Félicitation vous avez obtenu le score de 10 en #{nb_throw} lancers"
    puts "\n -----------------------------------------------------------------"
end

def perform(simulation=false)
    if simulation == true
        score = 0
        nb_throw = 0
        while score < 10
            nb_throw += 1
            result = rand(1..6)
            if result >= 5
                new_score = score + 1
            elsif result >= 2
                new_score = score
            else
                if score > 0
                    new_score = score - 1
                else
                    new_score = score
                end
            end
            score = new_score
        end
        return nb_throw
    else
        score = 0
        nb_throw = 0
        while score < 10
            nb_throw += 1
            result = throw_dice
            new_score = move(result, score)
            score = new_score
        end
        win(nb_throw)
        return nb_throw
    end
end

def average_finish_time
    throw_array = []
    100.times do
        nb_throw = perform(simulation=true)
        throw_array << nb_throw
    end
    average = throw_array.inject(0, :+) / throw_array.length
    puts "La simulation des 100 jeux a fini le jeu en #{average} lancés en moyenne"
end

perform(simulation=false)
average_finish_time