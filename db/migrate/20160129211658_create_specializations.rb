class CreateSpecializations < ActiveRecord::Migration
  def change
    create_table :specializations do |t|
      t.string :name
      t.integer :klass_id

      t.timestamps
    end
  end
end
