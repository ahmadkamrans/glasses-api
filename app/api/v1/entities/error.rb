class V1::Entities::Error <  Grape::Entity
  expose :error_context, documentation: { type: "String" }
  expose :error_message, documentation: { type: "String" }
  expose :error_code, documentation: { type: "String" }
  expose :error_fields, documentation: { type: "Object", example: { email: ['cant be blank'], password: ['cannot be blank'] } }
end
