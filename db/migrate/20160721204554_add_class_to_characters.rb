class AddClassToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :klass_id, :integer
  end
end
