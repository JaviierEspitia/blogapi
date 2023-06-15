module Secured
  def authenticate_user!
    token_regex = /^Bearer (\w+)$/

    # read HEADER of auth
    headers = request.headers
    if headers['Authorization'].present? && headers['Authorization'].match(token_regex)
      token = headers['Authorization'].match(token_regex)[1]
      if Current.user = User.find_by(auth_token: token)
        return
      end
    end

    render json: { error: 'Unauthorized' }, status: :unauthorized

  end
end