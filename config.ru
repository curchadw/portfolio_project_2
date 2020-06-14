require_relative './config/environment'

require_relative 'app/controllers/coach_controller'
require_relative 'app/controllers/team_controller'
require_relative 'app/controllers/players_controller'


use CoachController
use PlayersController
use TeamController
run ApplicationController