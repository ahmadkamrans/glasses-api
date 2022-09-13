class FrameAndLenseHandlerService
  include Interactor

  delegate :name, :description, :status, :stock, :price, :currency, :color, :prescription_type, :lense_type, :_obj, to: :context

  def call
    _currency = Currency.find_by(name: currency) if currency.present?

    obj = _obj.create_record!({
      name: name,
      description: description,
      status: status,
      stock: stock,
      price: price,
      currency: _currency&.id,
      color: color,
      prescription_type: prescription_type,
      lense_type: lense_type
    })
    context.message = "#{_obj.to_s} created successfully"

  rescue ActiveRecord::RecordInvalid => e
    context.fail!(message: e.record.errors)
  end
end
