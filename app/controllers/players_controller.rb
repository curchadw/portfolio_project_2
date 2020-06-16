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

    post '/players' do 
        @player = Player.create(:name => params[:name],:position => params[:position], :weight => params[:weight], :height => params[:height])
        redirect "/players"
    end


end