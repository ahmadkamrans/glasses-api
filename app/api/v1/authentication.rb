class V1::Authentication < Grape::API
  
  resource :authentications do
    desc 'Authenticate User' do
      failure [
        [403, 'Forbidden', V1::Entities::Error],
        [422.1, "validation_errors", V1::Entities::Error]
      ]
    end

    params do
      requires :email, type: String
      requires :password, type: String
    end

    post do
      _params = declared_params
      command = AuthenticateUser.call(declared_params)

      if command.success?
        present :token, command.result
      else
        fail!(:service, 1010, message: command.errors)
      end
    end
  end
end
