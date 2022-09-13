class V1::AuthenticatedEndpoints < Grape::API
  before { authenticate_request! }

  mount V1::Frames
  mount V1::Lenses
  mount V1::Glasses
end
