class AddCurrencyIdToFrames < ActiveRecord::Migration[6.1]
  def change
    add_reference :frames, :currency, foreign_key: true

    add_index :frames, [:price, :currency_id], unique: true
  end
end
