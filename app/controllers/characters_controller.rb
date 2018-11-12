class CharactersController < ApplicationController

<<<<<<< HEAD
    def index
        @characters = Character.all
=======
    def new
        @character = Character.new
>>>>>>> 71e254244858c1921cad1aabe6b3b469c8c15a85
    end

    def create 
        @character = Character.new(character_params)
        @character.user_id = session[:user_id]
        if @character.save
            redirect_to @character
        else
            byebug 
            render 'new'
        end
    end

    private 

    def character_params
        params.require(:character).permit(:name, :gender, :race_id)
    end

    def show
        @character = Character.find(params[:id])
    end

end