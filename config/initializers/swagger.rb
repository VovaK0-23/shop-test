GrapeSwaggerRails.options.before_action do
  GrapeSwaggerRails.options.app_url = request.protocol + request.host_with_port
end
GrapeSwaggerRails.options.validator_url = nil
GrapeSwaggerRails.options.url = '/api/v1/swagger_doc'


