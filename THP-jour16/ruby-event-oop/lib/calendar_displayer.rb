5.times do |row|
  puts "-----------------------------------------------------------------------"
  for line in 0..4 do
    if line == 0
      for number in 1..8 do
        if number < 8
          print "|#{number+(row*7)}".ljust(10, ' ')
        else print "|\n"
        end
      end
    elsif line == 2 and #{number+(row*7)} in Event.all_event_days
      print "EVENT".ljust(10, ' ')
    else
      puts "|         |         |         |         |         |         |         |"
    end
  end
end
puts "-----------------------------------------------------------------------"