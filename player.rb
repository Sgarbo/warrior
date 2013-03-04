class Player
  # método inicializar clase
  def initialize()  
    # atributos   
    @health = 20
    @attacking=false
    @no_att=0
  end
  
  def play_turn(warrior)

    if warrior.feel.empty?
      if @attacking
	@no_att += 1
	@attacking=false
      end
      
      #Only 7 of life is necessary to kill a sludge
      if ((warrior.health) >= 15) || (@health > warrior.health) || (@no_att == 3)
       warrior.walk!
      else
	warrior.rest!
      end
    else
     #if is not empty there is a monster attack
     warrior.attack!
     @attacking=true
    end
    
    @health = warrior.health
  end
end
