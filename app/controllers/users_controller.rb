class UsersController < ApplicationController
    
    get '/signup' do
        erb :'user/signup'
    end

    post '/signup' do
        if params == ""
            redirect to '/signup'
        else
            
          @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password], :name => params[:name])
          session[:user_id] = @user.id
          redirect to '/'
        end
    end


    

      get '/account' do
        erb :'players/account'
      end
    
      

      

end