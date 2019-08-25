class ApplicationController < ActionController::API

rescue_from ActiveRecord::RecordNotFound do |error|
  render json: { error: error.message }, status: :not_found
end

# rescue_from ActionController::RoutingError do |error|
#   render json: { error: error.message }, status: :not_found
# end


  # def catch404
  #   raise ActionController::RoutingError.new(params[:path])
  # end

end
