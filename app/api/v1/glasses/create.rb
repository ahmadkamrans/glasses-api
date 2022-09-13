class V1::Glasses::Create < Grape::API
  
  resource :glasses do
    desc 'Order custom glasses' do
      failure [
        [403, 'Forbidden', V1::Entities::Error],
        [422.1, "validation_errors", V1::Entities::Error]
      ]
    end

    params do
      requires :lense_id, type: Integer
      requires :frame_id, type: Integer

      requires :currency, type: String, default: 'USD', values: Currency::POPULAR_CURRENCIES
    end

    post do
      _params = declared_params

      authorize(Glasses, :create?)

      ActiveRecord::Base.transaction do
        lens = Lense.find(params[:lense_id])
        frame = Frame.find(params[:frame_id])
        _currency = Currency.find_by(name: params[:currency]) if params[:currency].present?

        if lens.currency_name != params[:currency] || frame.currency_name != params[:currency]
          fail! :glasses, :validation_errors, 'Currency of selected product is not same as selected currency'
        end

        if lens.stock == 0 || frame.stock == 0
          fail! :glasses, :validation_errors, 'Products are out of stock'
        end

        glasses = Glasses.create!(lense: lens, frame: frame, currency: _currency, user: current_user)
        ShoppingBasket.create!(glasses_ids: [glasses.id], user: current_user)

        present glasses, with: V1::Entities::Glasses
      rescue => e
        fail! :glasses, :validation_errors, e.message
      end
    end
  end
end
