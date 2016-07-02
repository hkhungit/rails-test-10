class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_comment, only: [:show, :reply, :destroy, :like, :edit, :update, :dislike]

  def index
    @comment = Comment.new 
    @comments = Comment.where(parent_id: 0)
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id  = current_user.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to comments_url }
        format.js   {}
      else 
        format.html { render :new}
        format.js { }
      end
    end
  end 

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to comments_url }
        format.js   { }
      else 
        format.html { render :edit}
        format.js   { }
      end
    end
  end

  def destroy 
    @comment.destroy
    redirect_to comments_url
  end

  def reply; end  

  def like
    @comment.votes.create({user_id: current_user.id})
    redirect_to comments_url
  end 

  def dislike
    @comment.votes.where({user_id: current_user.id}).destroy_all
    redirect_to comments_url
  end

  private
  def comment_params
    params.require(:comment).permit(:parent_id, :content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
