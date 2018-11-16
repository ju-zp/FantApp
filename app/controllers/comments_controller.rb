class CommentsController < ApplicationController

    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = session[:user_id]
        @comment.save
        character = Character.find(params[:comment][:character_id])
        redirect_to character_path(character.slug)
    end

    def destroy
        comment = Comment.find(params[:id])
        character = Character.find(comment.character_id)
        comment.destroy
        redirect_to character_path(character.slug)
    end

    private 

    def comment_params
        params.require(:comment).permit(:content, :rating, :character_id)
    end

end