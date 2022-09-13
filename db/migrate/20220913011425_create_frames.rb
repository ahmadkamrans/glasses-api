class CreateFrames < ActiveRecord::Migration[6.1]
  def change
    create_table :frames do |t|
      t.string     :name
      t.text       :description
      t.integer    :status, default: 0
      t.integer    :stock, default: 0
      t.float      :price

      t.index      :status

      t.timestamps
    end
  end
end
