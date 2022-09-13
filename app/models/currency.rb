class Currency < ApplicationRecord
	POPULAR_CURRENCIES = %w[USD GBP EUR JOD JPY].freeze

  validates :name, uniqueness: true
  validates :name, presence: true, inclusion: { in: POPULAR_CURRENCIES }

  def currency_name
  	self.name
  end
end
