class Player
  # método inicializar clase
  def initialize()  
    # atributos   
    @health = 20
    @attacking=false
    @no_cap=0
    @direction=:forward
    @move=true
    @captive=false
  end
  
  def play_turn(warrior)

    @a=warrior.look
    puts 'For '+@a[0].to_s
    puts @a[1]
    puts @a[2]
  
    @b=warrior.look(:backward)
    puts 'Back '+@b[0].to_s
    puts @b[1]
    puts @b[2]
    
    puts 'Last health ' + @health.to_s
    puts 'Health ' + warrior.health.to_s
    
    if @captive && @no_cap==1
      warrior.pivot!
      @captive=false
    
    elsif @b[2].to_s=='Archer'
      warrior.walk!
    elsif @a[0].to_s=='nothing'
      
      if @a[1].to_s=='Wizard'
	warrior.shoot!
	@attacking=true
     
      elsif @a[1].to_s=='Captive'
	warrior.walk!
      
      elsif @a[1].to_s=='nothing'
	
	if @a[2].to_s=='Wizard'
	  warrior.shoot!
	elsif @a[2].to_s=='Archer'
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
      @captive=true
      @no_cap+=1
    elsif @a[0].to_s=='Thick Sludge' || @a[0].to_s=='Sludge'
      warrior.attack!
    else
      #warrior.walk!
      
    end

    
      
    
    @health = warrior.health
  end
end
