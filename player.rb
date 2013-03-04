class Player
  def play_turn(warrior)
    if warrior.feel.empty?
      #Only 7 of life is necessary to kill a sludge
      if (warrior.health) >= 7
       warrior.walk!
      else
	warrior.rest!
      end
    else
     #if is not empty there is a monster attack
     warrior.attack!
    end
  end
end
