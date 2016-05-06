class CreateSpecializationSpells < ActiveRecord::Migration
  def change
    create_table :specialization_spells do |t|
      t.belongs_to :specialization, index: true
      t.belongs_to :spell, index: true

      t.timestamps null: false
    end
  end
end
