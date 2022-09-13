class ShoppingBasket < ApplicationRecord
  belongs_to :user

  enum status: {opened: 0, closed: 1}
end
