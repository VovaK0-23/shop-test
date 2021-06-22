class ResourcesController < ApplicationController
  inherit_resources

  before_action only: %i[show edit update destroy] do
    authorize resource
  end

  before_action only: %i[index new] do
    authorize resource_class
  end
end
