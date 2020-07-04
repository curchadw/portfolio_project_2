class PlayersController < ApplicationController
   
    
    
    get '/players' do
        redirect_if_not_logged_in
        @players = Player.all 
        erb :'players/index'
    end

    
    get '/players/new' do 
        redirect_if_not_logged_in
        erb :'players/new'
        
    end
  
   

    get '/players/:slug' do
        redirect_if_not_logged_in
        @player = Player.find_by_slug(params["slug"])
        erb :"players/show"
    
    end

   



    get '/players/:slug/edit' do  #load edit form
        redirect_if_not_logged_in
        @player = Player.find_by_slug(params[:slug])
        if @player && @player.user == current_user
          erb :"players/edit"
        else
          redirect to '/players'
        end
        
    end

    

    patch '/players/:slug' do
        redirect_if_not_logged_in
        if params[:name] == "" || params[:position] == "" || params[:height] == "" || params[:weight] == ""
          redirect to "/players/#{params[:slug]}/edit"
        else
          player = Player.find_by_slug(params[:slug])
           if  player && player.user == current_user
                player.update(:name => params[:name],:position => params[:position],:height => params[:height], :weight => params[:weight])
                                  
                redirect to "/players/#{@player.slug}"
           else
                redirect to "/players/#{@player.slug}/edit"
           end
        end
    end

    post '/players' do 
        redirect_if_not_logged_in
        if params[:name] == "" || params[:position] == "" || params[:height] == "" || params[:weight] == ""
            flash[:notice] = "<h3 class ='alert'>Please fill-in new player info!</h3>"
            redirect to '/players/new'
        else
            player = current_user.players.build(params)
            if  player.save 
              player.user_id = current_user.id
              flash[:notice] = "<h3 class ='success'>Successfully created a new player!</h3>"
              redirect to "/players/#{@player.slug}"
                 
            else 
            
               redirect to '/players/new'
            end
        end

        
    end

    delete '/players/:id' do 
        redirect_if_not_logged_in
        player = Player.find_by_id(params[:id])
        if player && player.user == current_user
            player.delete
        end
            redirect to '/players'
    
    end

    get '/user_players/:username' do
        redirect_if_not_logged_in
        @players = current_user.players
        erb :'players/show_user_players'
    end
end