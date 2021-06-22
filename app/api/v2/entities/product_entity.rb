module V2::Entities
  class ProductEntity < Grape::Entity
    expose :id, documentation: { type: 'Integer' }
    expose :name
    expose :price
    expose :categories
    expose :created_at
    expose :updated_at

    private

    def categories
      object.categories
    end
  end
end
