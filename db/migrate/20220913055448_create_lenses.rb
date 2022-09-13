class CreateLenses < ActiveRecord::Migration[6.1]
  def change
    create_table :lenses do |t|
      t.string     :color
      t.text       :description
      t.integer    :prescription_type, default: 0
      t.integer    :lense_type, default: 0
      t.integer    :stock, default: 0
      t.float      :price

      t.index      :prescription_type
      t.index      :lense_type
      t.index      :price

      t.timestamps
    end
  end
end
