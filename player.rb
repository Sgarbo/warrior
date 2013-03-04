class Player
  def play_turn(warrior)
    
    if warrior.feel.empty?
    #if empty walk
      warrior.walk!
    else
     #if is not empty there is a monster attack
    warrior.attack!
    end
  end
end
