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

    @a=warrior.look
    puts @a[0]
    puts @a[1]
    puts @a[2]
    
    puts 'Last health ' + @health.to_s
    puts 'Health ' + warrior.health.to_s
    
    if @attacking && @a[0].to_s=='nothing'
	@no_att += 1
	@attacking=false
    end
    
    if @a[0].to_s=='nothing'
      
      if @a[1].to_s=='Wizard'
	warrior.shoot!
	@attacking=true
      elsif @a[1].to_s=='Captive'
	warrior.walk!
      elsif @a[1].to_s=='nothing'
	if @a[2].to_s=='Wizard'
	  warrior.shoot!
	elsif @a[2].to_s=='nothing'
	  warrior.walk!
	else
	  warrior.walk!
	end
      else
      warrior.walk!
      end
      
    elsif @a[0].to_s=='Captive'
      warrior.rescue!
    else
      warrior.walk!
      
    end

    
      
    
    @health = warrior.health
  end
end
