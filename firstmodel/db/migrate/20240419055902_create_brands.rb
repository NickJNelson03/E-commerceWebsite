class CreateBrands < ActiveRecord::Migration[7.1]
  def change
    create_table :brands do |t|
      t.string :name
      t.text :desc
      t.string :logo

      t.timestamps
    end
  end
end
