class ApplicationController < Sinatra::Base

    configure do
        set :views, "app/views"
        set :public_dir, "public"
        enable :sessions
        set :session_secret, "team_secret"
    end
  
    get "/" do
        erb :index
    end

    helpers do

        def logged_in?
          !!current_user
        end
    
        def current_user
          @current_user ||= Team.find_by(id: session[:user_id]) if session[:user_id]
        end
    
      end
    
  end