class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.monetize :price
      t.datetime :expires_at

      t.timestamps
    end
  end
end
