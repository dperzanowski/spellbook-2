require 'pp'

# seed spells
spells = Rails.root.join(*%W[db data spells.yml])
pp *(YAML.load_file(spells).map { |attrs| Spell.where(attrs).first_or_create })
