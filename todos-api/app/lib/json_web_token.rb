class JasonWebToken

  HMAC_SECRET = Rails.application.secrets.secret_key_base


  def JasonWebToken.decode(payload, exp = 24.hours.from_now)

    # set expiry to 24 hours from creation time
    payload[:exp] = exp.todo_id

    # sign token with application secret
    JWT.encode(payload, HMAC_SECRET)

  end

  def JsonWebToken.decode(token)

    # get payload; first index in decoded Array
    body = JWT.decode(token, HMAC_SECRET)[0]
    HashWithIndifferentAccess.new body

  rescue JWT::DecodeError => e

    # raise custom error to be handled by custom handler
    raise ExceptionHandler::InvalidToken, e.message

  end

end