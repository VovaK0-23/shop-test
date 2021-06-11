require 'rails_helper'

RSpec.describe V1::Resources::ShopsResource, type: :request do
  describe 'GET api/v1/shops' do
    subject { get '/api/v1/shops' }

    it 'returns all shops' do
      shops = create_list(:shop, 5)

      subject

      expect(response).to have_http_status(200)
      expect(response.body).to eq(shops.to_json)
    end
  end

  describe 'GET api/v1/shops/{id}' do
    subject { get "/api/v1/shops/#{shop.id}" }

    let(:shop) { create(:shop) }

    context 'when shop exist' do
      it 'returns shop' do
        subject

        expect(response).to have_http_status(200)
        expect(response.body).to eq(shop.to_json)
      end
    end

    context 'when shop not exist' do
      it 'returns error' do
        shop.id = -1

        subject

        expect(response).to have_http_status(404)
        expect(response.body).to eq("{\"error\":\"Couldn't find Shop with 'id'=-1\"}")
      end
    end
  end

  describe 'GET api/v1/shops/products/{id}' do
    subject { get "/api/v1/shops/products/#{shop.id}" }

    let(:shop) { create(:shop) }

    def create_categories_and_products(shop)
      categories = FactoryBot.create_list(:category, 2, shop: shop)
      all_products = []
      categories.each do |category|
        FactoryBot.create_list(:product, 2).each do |product|
          all_products << product
          FactoryBot.create(:category_product, product: product, category: category)
        end
      end
      all_products
    end

    context 'when shop exist' do
      it 'returns products of shop' do
        products = create_categories_and_products(shop)

        subject

        expect(response).to have_http_status(200)
        expect(response.body).to eq(products.to_json)
      end
    end

    context 'when shop not exist' do
      it 'returns error' do
        create_categories_and_products(shop)
        shop.id = -1

        subject

        expect(response).to have_http_status(404)
        expect(response.body).to eq("{\"error\":\"Couldn't find Shop with 'id'=-1\"}")
      end
    end
  end
end
