class UsersController < ApplicationController
    
    get '/signup' do
        erb :'user/signup'
    end

    post '/signup' do
        if params[:username] == "" || params[:email] == "" || params[:password] == "" || params[:name] == ""
            flash[:notice] = "<h3 class ='alert'>Please fill-in info!</h3>"
            redirect to '/signup'
        
        
        else
            
              
           user = User.new(:username => params[:username], :email => params[:email], :password => params[:password], :name => params[:name])
           if user.save
            session[:user_id] = user.id
            redirect to '/account'
           else
            flash[:notice] = "<h3>Username already exist, try another one.</h3>"
            redirect to '/signup'
           end
            
        end
    end


    

      
    
      get '/account' do
        redirect_if_not_logged_in
        erb :'players/account'
      
      end

      

end