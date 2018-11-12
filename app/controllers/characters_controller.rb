class CharactersController < ApplicationController
    before_action :gender_array, only: [:edit, :new]

    def index
        @characters = Character.all
    end
    def new
        
        @character = Character.new
    end

    def show
        @character = Character.find(params[:id])
    end

    def create 
        @character = Character.new(character_params)
        @character.user_id = session[:user_id]
        if @character.save
            redirect_to @character
        else
            flash[:errors] = @character.errors.full_messages
            redirect_to new_character_path
        end
    end

    def edit
        @character = Character.find(params[:id])
    end

    def update
        @character = Character.find(params[:id])
        @character.update(character_params)
        if @character.valid?
            redirect_to @character
        else
            render 'edit'
        end
    end

    private 

    def gender_array
        @gender = ["Male", "Female", "Non-Binary", "Other"]
    end

    def character_params
        params.require(:character).permit(:name, :gender, :race_id)
    end


end