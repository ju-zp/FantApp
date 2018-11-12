class CharactersController < ApplicationController

    def index
        @characters = Character.all
    end

    def create 
    end

    def show
        @character = Character.find(params[:id])
    end

end