class PlayersController < ApplicationController
    get '/players' do
     if logged_in?
        @players = Player.all 
        erb :'players/players'
    
     else
        redirect to 'login'
     end
    end

    get '/players/new' do 
        if logged_in?
            erb :'players/add_player'
        else
         redirect '/login'
        end
    end

    

    get "/players/:id" do
      if logged_in?
        @player = Player.find(params[:id])
        erb :"players/show_player"
     else
       redirect to '/login' 
     end
    end

    get '/players/:id/edit' do  #load edit form
        #if logged_in?
         @player = Player.find_by_id(params[:id])
            #if @player && @player.user == current_user
            erb :"players/modify"
            #redirect to '/players'
            #end
        #else
            #redirect to '/login'
        #end
    end

    patch '/players/:id' do
        @player = Player.find_by_id(params[:id])
        @player.name = params[:name]
        @player.position = params[:position]
        @player.height = params[:height]
        @player.weight = params[:weight]
        @player.save
        redirect to "/players/#{@player.id}"    
        
    end

    post "/players" do 
        if params == ""
          redirect to '/players/new'
        else
         @player = Player.create(params)
         redirect to "/players/#{@player.id}"
         
        end
     end

    delete '/players/:id' do #delete action
      if logged_in?
        @player = Player.find_by_id(params[:id])
        #if @player && @player.user == current_user
        @player.delete
        #end
            redirect to '/players'
        else
            redirect to '/login'
        end
    end
end
