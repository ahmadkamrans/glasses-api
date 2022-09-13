class Frame < ApplicationRecord
  include SetCurrency

  enum status: {active: 0, inactive: 1}

  def self.create_record!(params)
    Frame.create!(name: params[:name], description: params[:description],
                  status: params[:status], stock: params[:stock],
                  price: params[:price], currency_id: params[:currency])
  end
end
