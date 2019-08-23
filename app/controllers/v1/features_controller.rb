class FeaturesController < ApplicationController
  Feature.generate_scopes

  include JSON_Response

  def index
  end

  def show
  end

end
