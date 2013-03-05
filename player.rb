class Player
  # método inicializar clase
  def initialize()  
    # atributos   
    @health = 20
    @attacking=false
    @no_att=0
    @direction=:backward
    @move=true
    @captive=false
  end
  
  def play_turn(warrior)

    puts 'Last health ' + @health.to_s
    puts 'Health ' + warrior.health.to_s
    if warrior.feel(@direction).empty?
      if @attacking
	@no_att += 1
	@attacking=false

      end
      
      if (@health > warrior.health) && ((warrior.health < 10 && @no_att==1))
	@move=true
	@direction=:backward
      elsif (@health <= warrior.health) && ((warrior.health < 16 && @no_att==1))
	@move=false
      elsif @captive
	@move=true
	@direction=:forward
      end
      
      #There are only 3 enemies
      if @move
	warrior.walk!(@direction)
      else
	warrior.rest!
      end
    
      
      #More than 12 of life is necessary to kill a Sludge

      
    else
      
      #if is not empty and there is a captive rescue
      if warrior.feel(@direction).captive?
	warrior.rescue!(@direction)
	@captive=true;
      else
	#if is not empty and there is a monster attack
	warrior.attack!
	@attacking=true
      end
    end
    
    @health = warrior.health
  end
end
