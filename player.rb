class Player
  # método inicializar clase
  def initialize()  
    # atributos   
    @health = 20
    @attacking=false
    @no_att=0
  end
  
  def play_turn(warrior)

    puts 'Last health ' + @health.to_s
    puts 'Health ' + warrior.health.to_s
    if warrior.feel.empty?
      if @attacking
	@no_att += 1
	@attacking=false
      end
      
      #More than 12 of life is necessary to kill a Sludge
      #There are only 3 enemies
      if (warrior.health > 12) || (@health > warrior.health) || (@no_att == 3)
       warrior.walk!
      else
	warrior.rest!
      end
    else
      #if is not empty and there is a captive rescue
      if warrior.feel.captive?
	warrior.rescue!
      else
	#if is not empty and there is a monster attack
	warrior.attack!
	@attacking=true
      end
    end
    
    @health = warrior.health
  end
end
