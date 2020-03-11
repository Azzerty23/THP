class BoardCase
  #TO DO : la classe a 2 attr_accessor, sa valeur en string (X, O, ou vide), ainsi que son identifiant de case
attr_accessor :value

  def initialize(value)
	    #TO DO : doit régler sa valeur, ainsi que son numéro de case
	    @value = value
  end

  def value=(value) #setter method
    if @value == ' '
    @value = value
    else
      puts "Ne fais pas n'importe quoi !"
      sleep 1.5
    end
  end

end