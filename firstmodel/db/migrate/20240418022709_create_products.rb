class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :desc
      t.float :price
      t.integer :stock

      t.timestamps
    end
  end
end
