class V1::Entities::Lense < Grape::Entity
  expose :color, documentation: { type: "String" }
  expose :description, documentation: { type: "String" }
  expose :prescription_type, documentation: { type: "String" }
  expose :lense_type, documentation: { type: "String" }
  expose :stock, documentation: { type: "Integer" }
  expose :price, documentation: { type: "Float" }
  expose :currency_name, documentation: { type: "String" }
end
