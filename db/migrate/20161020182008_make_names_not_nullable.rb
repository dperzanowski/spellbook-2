class MakeNamesNotNullable < ActiveRecord::Migration
  def change
    change_column :specializations, :name, :string, null: false
    change_column :spells, :name, :string, null: false
  end
end
