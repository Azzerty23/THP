def half_pyramid
    puts "Salut, bienvenue dans ma super pyramide ! Combien d'étages veux-tu ?"
    print "> "
    step = gets.chomp.to_i
    puts "Voici la pyramide :"

    blank = 0
    for i in 1..step do
        blank = step - i
        puts "#{' ' * blank}#{'#' * i}"
    end
end

def full_pyramid
    puts "Salut, bienvenue dans ma super pyriamide ! Combien d'etage veux-tu chere personne qui m'utilise en se moment meme ?"
    print "> "
    step = gets.chomp.to_i
    puts "Voici la pyramide :"

    blank = step - 1
    block = 1
    step.times do
        puts "#{' ' * blank}#{'#' * block}#{' ' * blank}"
        block += 2
        blank -= 1
    end
end


def wtf_pyramid
    puts "Salut, bienvenue dans ma super pyramide ! Combien d'étages veux-tu ? (choisis un nombre impair)"
    print "> "
    step = gets.chomp.to_i
    while step%2 == 0
        puts "On t'a demandé un nombre impair !"
        print "> "
        step = gets.chomp.to_i 
    end
    puts "Voici la pyramide :"
    blank = (step - 1) / 2
    block = 1
    i = 0
    step.times do
        # puts "i = #{i} | step = #{step} | block = #{block} | blank #{blank}"
        puts "#{' ' * blank}#{'#' * block}#{' ' * blank}"
        i += 1
        if i < (step/2) + 1
            block += 2
            blank -= 1
        else
            block -= 2
            blank += 1
        end
    end
end

# half_pyramid
# full_pyramid
wtf_pyramid