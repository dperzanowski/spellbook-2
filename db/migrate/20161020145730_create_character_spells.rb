class CreateCharacterSpells < ActiveRecord::Migration
  def change
    create_table :character_spells do |t|
      t.belongs_to :character, index: true
      t.belongs_to :spell, index: true

      t.timestamps null: false
    end
  end
end
