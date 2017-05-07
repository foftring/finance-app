class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.string :ticker
      t.string :name
      t.decimal :current_price
      t.decimal :one_year_estimate
      t.decimal :percent_change

      t.timestamps
    end
  end
end
