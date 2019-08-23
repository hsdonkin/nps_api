module JSON_Response

  def json_response(object, status = :ok)
    render json: object, status: status
  end

end
