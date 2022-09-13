class V1::Root < Grape::API
  version 'v1', using: :path

  mount V1::AuthenticatedEndpoints
  mount V1::Authentication
end
