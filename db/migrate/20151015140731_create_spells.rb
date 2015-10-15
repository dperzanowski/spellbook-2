class CreateSpells < ActiveRecord::Migration
  def change
    create_table :spells do |t|
      t.string    :name
      t.integer   :level
      t.boolean   :ritual
      t.string    :school
      t.text      :components
      t.string    :source
      t.text      :description
      t.datetime  :created_at
      t.datetime  :updated_at
      t.string    :casting_time
      t.string    :range
      t.string    :duration

      t.timestamps null: false
    end
  end
end
