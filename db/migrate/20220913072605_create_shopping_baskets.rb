class CreateShoppingBaskets < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_baskets do |t|
      t.string :glasses_ids, array: true, default: []
      t.references :user,    null: false
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
