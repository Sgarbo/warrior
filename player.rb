class Player
  # método inicializar clase
  def initialize()  
    # atributos   
    @health = 20
    @attacking=false
    @no_att=0
    @direction=:forward
    @move=true
    @captive=false
  end
  
  def play_turn(warrior)

    puts 'Last health ' + @health.to_s
    puts 'Health ' + warrior.health.to_s
    if warrior.feel(:forward).wall?
      warrior.pivot!
    
    elsif warrior.feel(:forward).empty?
      if @attacking
	@no_att += 1
	@attacking=false

      end
      
      if (@health> warrior.health && warrior.health>4) ||  warrior.health>=10 || @no_att==2
	@move=true
	@direction=:forward
      elsif (@health <= warrior.health) && ((warrior.health < 10 && @no_att==1) && @direction==:backward)
	@move=false
      else
	@move=true
	@direction=:backward
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
