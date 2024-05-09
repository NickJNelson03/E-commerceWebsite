class AddUserToBrands < ActiveRecord::Migration[7.1]
  def change
    add_reference :brands, :user, null: true, foreign_key: true
  end
end
