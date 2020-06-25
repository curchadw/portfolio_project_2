require './config/environment'


  
use Rack::MethodOverride
use UsersController
use PlayersController
use SessionsController
run ApplicationController