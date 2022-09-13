class V1::Entities::Glasses < Grape::Entity
  expose :total_price, documentation: { type: "Float" }
  expose :currency_name, documentation: { type: "String" }
end
