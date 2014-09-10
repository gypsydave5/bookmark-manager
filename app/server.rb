require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'

require_relative'models/link' # this needs to be done after datamapper is initialised
require_relative'models/tag' # this needs to be done after datamapper is initialised
require_relative'models/user'

require_relative 'helpers/application.rb'
require_relative 'data_mapper_setup.rb'

require_relative 'controllers/users.rb'
require_relative 'controllers/sessions.rb'
require_relative 'controllers/links.rb'
require_relative 'controllers/tags.rb'
require_relative 'controllers/application.rb'

enable :sessions
set :sessions_secret, 'super secret'
set :partial_template_engine, :erb
use Rack::Flash
use Rack::MethodOverride




