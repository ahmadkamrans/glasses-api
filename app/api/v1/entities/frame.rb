class V1::Entities::Frame < Grape::Entity
  expose :name, documentation: { type: "String" }
  expose :description, documentation: { type: "String" }
  expose :status, documentation: { type: "String" }
  expose :stock, documentation: { type: "Integer" }
  expose :price, documentation: { type: "Float" }
  expose :currency_name, documentation: { type: "String" }
end
