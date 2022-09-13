class V1::Frames < Grape::API
  mount V1::Frames::Index
  mount V1::Frames::Create
end
