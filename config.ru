require './config/environment'


  
use Rack::MethodOverride
use CoachesController
use PlayersController
use UsersController
use SessionsController
run ApplicationController