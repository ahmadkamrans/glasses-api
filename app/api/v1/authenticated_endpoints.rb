class V1::AuthenticatedEndpoints < Grape::API
  before { authenticate_request! }

  mount V1::Frames
end
