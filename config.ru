require './config/environment'


  
use Rack::MethodOverride
use CoachesController
use PlayersController
use TeamsController
run ApplicationController