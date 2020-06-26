class UsersController < ApplicationController
    
    get '/signup' do
        erb :'user/signup'
    end

    post '/signup' do
        if params[:username] == "" || params[:email] == "" || params[:password] == "" || params[:name] == ""

            redirect to '/signup'
        else
            
          @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password], :name => params[:name])
          session[:user_id] = @user.id
          redirect to '/account'
        end
    end


    

      get '/account' do
        erb :'players/account'
      end
    
      

      

end