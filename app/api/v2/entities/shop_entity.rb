module V2::Entities
  class ShopEntity < Grape::Entity
    expose :id, documentation: { type: 'Integer' }
    expose :name
    expose :created_at
    expose :updated_at
  end
end
