class CreateCurrencies < ActiveRecord::Migration[6.1]
  def change
    create_table :currencies do |t|
      t.string :prefixes
      t.string :name, unique: true

      t.timestamps
    end

    #initial seed data to run in migration
    Currency::POPULAR_CURRENCIES.each do |currency|
      Currency.find_or_create_by(name: currency)
    end
  end
end
