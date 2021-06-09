require 'grape-swagger-rails'

module API
  module V2
    class Base < Grape::API
      mount API::V2::Shops
      # mount API::V1::AnotherResource

      add_swagger_documentation(
        api_version: 'v2',
        hide_documentation_path: true,
        mount_path: '/api/v2/swagger_doc',
        hide_format: true
      )
    end
  end
end
