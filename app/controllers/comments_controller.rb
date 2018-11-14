class CommentsController < ApplicationController

    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = session[:user_id]
        @comment.save
        redirect_to character_path(params[:comment][:character_id])
    end

    def destroy
        comment = Comment.find(params[:id])
        character_id = comment.character_id
        comment.destroy
        redirect_to character_path(character_id)
    end

    private 

    def comment_params
        params.require(:comment).permit(:content, :rating, :character_id)
    end

end