class Spell < ActiveRecord::Base
  def print_level
    if self.level == 0
      return "Cantrip"
    else
      return "Level #{self.level}"
    end
  end
end
