list = []
50.times do |i|
    i +=1
    if i < 10
        list << "jean.dupon.0#{i.to_s}@email.fr"
    else
        list << "jean.dupon.#{i.to_s}@email.fr"
    end
end

list.length.times do |i|
    if i%2 == 0
        puts list[i-1]
    end
end

puts list.length