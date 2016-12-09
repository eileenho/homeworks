class AddIndextoToys < ActiveRecord::Migration
  def change
    add_index :toys, :name, unique: true
  end
end
