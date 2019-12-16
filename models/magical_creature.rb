class MagicalCreature
  attr_reader :name, :magical_ability, :age
  def initialize(name, magical_ability, age = nil)
    @name = name
    @magical_ability = magical_ability
    @age = age
  end

  def ancient?
    if @age > 200 || nil
      return true
    elsif @age <= 200
      return false
    end
  end
end
