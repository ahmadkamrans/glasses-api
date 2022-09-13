class V1::Lenses::Create < Grape::API
  
  resource :lenses do
    desc 'Create a Lense' do
      failure [
        [403, 'Forbidden', V1::Entities::Error],
        [422.1, "validation_errors", V1::Entities::Error]
      ]
    end

    params do
      requires :name, type: String
      requires :description, type: String
      requires :prescription_type, type: String, default: 'fashion', values: ['fashion', 'single_vision', 'varifocals']
      requires :lense_type, type: String, default: 'classic', values: ['classic', 'blue_light', 'transition']
      requires :stock, type: Integer
      requires :price, type: Float
      requires :currency, type: String, default: 'USD', values: Currency::POPULAR_CURRENCIES
    end

    post do
      _params = declared_params
      _params.merge!(_obj: Lense)

      authorize(Lense, :create?)

      response = ::FrameAndLenseHandlerService.call(_params)

      if response.success?
        present :message, response.message
      else
        fail!(:service, 1010, message: response.message)
      end
    end
  end
end
