# block IP list
Rack::Attack.blocklist('block local IPs') do |req|
['127.0.0.2', '::2'].include?(req.ip)
end
#  Generete error message
#  for blocked IP
Rack::Attack.blocklisted_responder = lambda do |env|
  [ 403,  # Code HTTP 403 Forbidden
    { 'Content-Type' => 'application/json' },
    [{ error: 'Blocked IP' }.to_json]
  ]
end
#
# config du throttle vers ddos
Rack::Attack.throttle("requests by ip", limit: 5, period: 2) do |request|
   Rails.logger.info "Adresse IP détectée : #{request.ip}"
  request.ip
end

# Throttle login attempts for a given email parameter to 6 reqs/minute
# Return the *normalized* email as a discriminator on POST /login requests
Rack::Attack.throttle('limit logins per email', limit: 2, period: 60) do |req|
  if req.path == '/api/v1/login' && req.post?
    # Normalize the email, using the same logic as your authentication process, to
    # protect against rate limit bypasses.
    req.params['email'].to_s.downcase.gsub(/\s+/, "")
  end
end
# config response
Rack::Attack.throttled_responder = lambda do |env|
  [ 429,  # Code HTTP 429 Too Many Requests
    { 'Content-Type' => 'application/json' },
    [{ error: 'Too Many request. Please try again later' }.to_json]
  ]
end
