class V1::Lenses < Grape::API
  mount V1::Lenses::Index
  mount V1::Lenses::Create
end
