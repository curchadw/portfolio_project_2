class UsersController < ApplicationController
    
    get '/signup' do
        erb :'user/signup'
    end

    post '/signup' do
        if params[:username] == "" || params[:email] == "" || params[:password] == "" || params[:name] == ""
            flash[:notice] = "<h3 class ='alert'>Please fill-in info!</h3>"
            redirect to '/signup'
        
        
        else
            if @user
              flash[:notice] = "<h3>Username already exist, try anoter one.</h3>"
              redirect to '/signup'
            else
              @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password], :name => params[:name])
              session[:user_id] = @user.id
              redirect to '/account'
            
            end
        end
    end


    

      get '/account' do
        erb :'players/account'
      end
    
      

      

end