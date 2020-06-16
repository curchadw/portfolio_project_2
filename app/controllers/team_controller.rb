class TeamController < ApplicationController
    get '/signup' do
        erb :'team/signup'
    end

    post '/signup' do
        if params == ""
            redirect to '/signup'
        else
            
          @user = Team.new(:username => params[:username], :email => params[:email], :password => params[:password], :name => params[:name])
          @user.save
          session[:user_id] = @user.id
          redirect to '/'
        end
    end


    get '/login' do
        if !logged_in?
          erb :'team/login'
        else
          redirect to '/account'
        end
      end

      post '/login' do
        @user = Team.find_by(:username => params[:username], password: params[:password])
        if @user
            session[:user_id] = @user.id
          redirect to "/account"
        else
          redirect to '/login'
        end
      end

      get '/account' do
        erb :'players/account'
      end
    
      get '/logout' do
        if logged_in?
          session.destroy
          redirect to '/'
        end
      end

end