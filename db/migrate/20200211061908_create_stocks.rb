class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :title
      t.string :description
      t.string :image
      t.string :price

      t.timestamps
    end
  end
end
