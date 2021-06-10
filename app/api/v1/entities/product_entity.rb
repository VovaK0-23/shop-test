module V1::Entities
  class ProductEntity < Grape::Entity
    expose :id, documentation: { type: 'Integer' }
    expose :name
    expose :price
    expose :created_at
    expose :updated_at
  end
end
