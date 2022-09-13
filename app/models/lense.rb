class Lense < ApplicationRecord
  include SetCurrency

  enum prescription_type: {fashion: 0, single_vision: 1, varifocals: 2}
  enum lense_type: {classic: 0, blue_light: 1, transition: 2}


  def self.create_record!(params)
    Lense.create!(color: params[:color], description: params[:description],
                  prescription_type: params[:prescription_type], lense_type: params[:lense_type],
                  stock: params[:stock], price: params[:price], currency_id: params[:currency])
  end
end
