class SessionsController < ApplicationController

    get '/login' do
        if !logged_in?
         erb :'user/login'
        else
         redirect to '/account'
        end
    end

      post '/login' do
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
         session[:user_id] = user.id
         redirect to "/account"
        else
         flash[:notice] = "<h3 class ='alert'>Please provide correct credentials!</h3>"
         redirect to '/login'
        end
      end

      get '/logout' do
        if logged_in?
         session.destroy
         redirect to '/'
        end
      end

      get "/failure" do
         erb :'user/failure'
      end

end