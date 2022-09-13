require 'active_support/concern'

module SetCurrency
  extend ActiveSupport::Concern

  included do
    belongs_to :currency
    validates :price, uniqueness: { scope: :currency_id }

    delegate :currency_name, to: :currency
  end
end
