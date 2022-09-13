class V1::Glasses < Grape::API
  mount V1::Glasses::Create
end
