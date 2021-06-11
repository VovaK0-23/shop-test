GrapeSwaggerRails.options.before_action do
  GrapeSwaggerRails.options.app_url = request.protocol + request.host_with_port + request.path.delete_suffix('/docs/')
end
GrapeSwaggerRails.options.validator_url = nil
GrapeSwaggerRails.options.url = '/swagger_doc'

