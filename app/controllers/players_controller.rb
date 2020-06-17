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

    post "/players" do 
       if params == ""
         redirect to '/players/new'
       else
        @player = Player.create(params)
        redirect to "/players/#{@player.id}"
        
       end
    end

    get "/players/:id" do
        @player = Player.find(params[:id])
        erb :"players/show_player"
    end


end