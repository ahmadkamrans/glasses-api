class V1::Frames::Create < Grape::API
  
  resource :frames do
    desc 'Create a Frame' do
      failure [
        [403, 'Forbidden', V1::Entities::Error],
        [422.1, "validation_errors", V1::Entities::Error]
      ]
    end

    params do
      requires :name, type: String
      requires :description, type: String
      requires :status, type: String, default: 'active', values: ['active', 'inactive']
      requires :stock, type: Integer
      requires :price, type: Float
      requires :currency, type: String, default: 'USD', values: Currency::POPULAR_CURRENCIES
    end

    post do
      _params = declared_params
      _params.merge!(_obj: Frame)

      authorize(Frame, :create?)

      response = ::FrameAndLenseHandlerService.call(_params)

      if response.success?
        present :message, response.message
      else
        fail!(:service, 1010, message: response.message)
      end
    end
  end
end
