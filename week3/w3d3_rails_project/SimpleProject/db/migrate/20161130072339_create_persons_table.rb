class CreatePersonsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :persons do |t|
      t.string :name
      t.integer :house_id

      t.timestamp
    end
  end
end
