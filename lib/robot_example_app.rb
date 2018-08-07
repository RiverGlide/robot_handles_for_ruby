require "sinatra/base"

class RobotExampleApp < Sinatra::Base
  get '/' do
    haml :index, format: :html5
  end

  post '/' do
    haml :results, format: :html5, locals: {params: params}
  end
end
