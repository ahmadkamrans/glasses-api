class Glasses < ApplicationRecord
  belongs_to :user
  belongs_to :lense
  belongs_to :frame
  belongs_to :currency

  delegate :currency_name, to: :currency

  after_commit :decrement_stocks

  protected
  def total_price
    self.lense.price + self.frame.price
  end

  def decrement_stocks
    self.lense.decrement!(:stock) if self.lense.stock.positive?
    self.frame.decrement!(:stock) if self.frame.stock.positive?
  end
end
