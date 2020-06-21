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
        if logged_in?
         @player = Player.find_by_id(params[:id])
            if @player && @player.team == current_user
                erb :"players/modify"
            else
                redirect to '/players'
            end
        else
            redirect to '/login'
        end
    end

    patch '/players/:id' do
        if logged_in?
            if params == ""
                redirect to "/players/#{params[:id]}/edit"
            else
              @player = Player.find_by_id(params[:id])
                if  @player && @player.team == current_user
                    @player.name = params[:name]
                    @player.position = params[:position]
                    @player.height = params[:height]
                    @player.weight = params[:weight]
                    @player.save
                    redirect to "/players/#{@player.id}"
                else
                    redirect to "/players/#{@player.id}/edit"
                end
            end
        else
            redirect to '/login'
        end     
        
          
        
    end

    post "/players" do 
      if logged_in?
        if params == ""
          redirect to '/players/new'
        else
            @player = current_user.players.build(params)
            if @player.save
                redirect to "/players/#{@player.id}"
            else  
            redirect to '/players/new'
            end
          end
         else
            redirect to "/login"
        end
        
     end

    delete '/players/:id' do 
      if logged_in?
        @player = Player.find_by_id(params[:id])
        if @player && @player.team == current_user
        @player.delete
        end
            redirect to '/players'
        else
            redirect to '/login'
        end
    end
end
