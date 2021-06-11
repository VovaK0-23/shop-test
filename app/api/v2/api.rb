require 'grape-swagger-rails'

module V2
  class API < Grape::API
    mount Resources::ShopsResource
    # mount API::V1::AnotherResource

    add_swagger_documentation(
      api_version: 'v2',
      hide_documentation_path: true,
      mount_path: '/swagger_doc',
      hide_format: true
    )
  end
end
