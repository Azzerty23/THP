list = []
50.times do |i|
    i +=1
    if i < 10
        list << "jean.dupon.0#{i.to_s}@email.fr"
    else
        list << "jean.dupon.#{i.to_s}@email.fr"
    end
end
puts list