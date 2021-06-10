module V2::Entities
  class ProductEntity < Grape::Entity
    expose :id, documentation: { type: 'Integer' }
    expose :name
    expose :price
    expose :category
    expose :created_at
    expose :updated_at

    private

    def category
      object.categories
    end
  end
end
