class AddCurrencyIdToLenses < ActiveRecord::Migration[6.1]
  def change
    add_reference :lenses, :currency, foreign_key: true

    add_index :lenses, [:price, :currency_id], unique: true
  end
end
