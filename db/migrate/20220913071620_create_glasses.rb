class CreateGlasses < ActiveRecord::Migration[6.1]
  def change
    create_table :glasses do |t|
      t.references :user,   null: false
      t.references :lense,   null: false
      t.references :frame,   null: false
      t.float      :price
      t.references :currency

      t.index [ :lense_id, :frame_id ]

      t.timestamps
    end
  end
end
