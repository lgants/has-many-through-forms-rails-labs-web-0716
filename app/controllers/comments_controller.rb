require 'pry'

class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    if params[:comment][:user_id].empty?
      @user = User.new
      @user.username = params[:comment][:user_attributes][:username]
      @user.comments << comment
      @user.save
    end
    redirect_to post_path(comment.post_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
