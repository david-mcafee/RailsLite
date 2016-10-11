require 'rack'

# we are creating an "app" (i.e. our proc), that gets sent environment
app = Proc.new do |env|
  #create request object
  req = Rack::Request.new(env)
  # environment is ruby hash constructed by the middleware

  #create response object
  res = Rack::Response.new

  #content type
  res['Content-Type'] = 'text/html'

  # access the path and write to our response
  # http://www.rubydoc.info/gems/rack/Rack/Request
  res.write(req.path)

  res.finish
end

Rack::Server.start(
  app: app,
  Port: 3000
)
