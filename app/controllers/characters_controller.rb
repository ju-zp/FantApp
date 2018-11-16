class CharactersController < ApplicationController
    before_action :gender_array, only: [:edit, :new, :update, :create]
    before_action :rating_array, only: [:show]
    before_action :logged_in?
    before_action :get_character, only: [:show, :edit, :update, :destroy]

    def index
        if params[:race_id] && params[:race_id] != ""
            @characters = Character.all.select do |character|
                race_obj = Race.find(params[:race_id])
                @race = [race_obj.name, race_obj.id]
                character.race_id == params[:race_id].to_i
            end
        else
            @characters = Character.all
        end
    end
    
    def new
        @character = Character.new
    end

    def show
        @comments = Comment.all.select{|c| c.character_id == @character.id}
        @comment = Comment.new
    end

    def create 
        @character = Character.new(character_params)
        @character.user_id = session[:user_id]
        @character.slug = @character.to_slug
        if @character.save
            redirect_to @character
        else
            render 'new' 
        end
    end

    def edit
    end

    def update
        @character.update(character_params)
        @character.slug = @character.to_slug
        if @character.valid?
            redirect_to @character
        else
            render 'edit'
        end
    end

    def destroy
        @character.destroy
        redirect_to profile_path
    end

    private 

    def gender_array
        @gender = ["Male", "Female", "Non-Binary", "Other"]
    end

    def rating_array
        @rating = [1,2,3,4,5]
    end

    def character_params
        params.require(:character).permit(:name, :gender, :race_id)
    end

    def get_character
        @character = Character.find_by_slug(params[:slug])
    end


end