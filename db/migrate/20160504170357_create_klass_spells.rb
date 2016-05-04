class CreateKlassSpells < ActiveRecord::Migration
  def change
    create_table :klass_spells do |t|
      t.belongs_to :spell, index: true
      t.belongs_to :klass, index: true

      t.timestamps null: false
    end
  end
end
