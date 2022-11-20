class CommentsController < ApplicationController

  before_action :set_comment, only: %i[ show edit update destroy ]
  before_action :get_movies, only: %i[ new create edit ]

  def index
    #adding filter for unapproved/ fake comments
    @comments = Comment.where(approved: false)
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
    if @comment.approved == true 
      @comment.create_log
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
    if @comment.approved == true 
      @comment.create_log
    end
  end

  def destroy 
    @comment.destroy
    redirect_to comments_path
  end

  private

  def get_movies
    @movies = Movie.selecte_movies_attributes
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :approved, :movie_id)
  end
  
end
