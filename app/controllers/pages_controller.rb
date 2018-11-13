class PagesController < ApplicationController

    def welcome
        @user = User.new
    end

    def login
    end
    
end