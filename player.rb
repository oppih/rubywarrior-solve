class Player
  def play_turn(warrior)
    if warrior.feel.empty?
      if @rescued != true && warrior.feel(:backward).empty?
        warrior.walk!(:backward)
      elsif warrior.feel(:backward).captive?
        warrior.rescue!(:backward)
        @rescued = true
      elsif warrior.feel(:backward).empty? && warrior.health < 8
        #warrior.rest!
        warrior.walk!(:backward)
      elsif warrior.feel(:backward).wall? && warrior.health < 15
        warrior.rest!
      else warrior.feel(:backward).wall?
        warrior.walk!
      end
    else
      warrior.attack!
    end
    @health = warrior.health
  end
end
