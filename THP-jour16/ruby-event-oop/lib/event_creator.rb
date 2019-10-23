class EventCreator

  def initialize

    puts "Salut, tu veux créer un événement ? Cool !"
    puts "Commençons. Quel est le nom de l'événement ?"
    print "> "
    title = gets.chomp

    puts "Super. Quand aura-t-il lieu ?"
    start_date = ""
    until start_date.is_a?(Time)
      print "> "
      begin
        start_date = Time.parse(gets.chomp)
      rescue
        puts "Renseigne une date au format 'AAAA-MM-JJ HH:MM:SS'"
      end
    end
    start_date = start_date.strftime("%d/%m/%Y %H:%M:%S")

    puts "Au top. Combien de temps va-t-il durer (en minutes) ?"
    print "> "
    duration = gets.chomp.to_i

    puts "Génial. Qui va participer ? Balance leurs e-mails"
    attendees = []
    input = "0"
    while input != ''
      print "> "
      input = gets.chomp
      attendees << input
    end
    
    new_envent = Event.new(start_date, duration, title, attendees)
    puts "Super, c'est noté, ton évènement a été créé !"
    new_envent.to_s

  end

end