class CommentsController < ApplicationController

  before_action :set_comment, only: %i[ show edit update destroy ]

  def index
      @comments = Comment.order(id: :desc)
  end

  def show
      @comments = Comment.all
  end


  def new
      @comment = Comment.new
  end

  def create
      @comment = Comment.new(comment_params)
      if @comment.save
        redirect_to comments_path
    else
        render :edit
    end
  end

  def edit 
  end

  def update 
    if @comment.update(comment_params)
        redirect_to comments_path
    else
        render :edit
    end
  end

  def destroy 
    @comment.destroy
    redirect_to comments_path
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :approved)
  end
  
end
