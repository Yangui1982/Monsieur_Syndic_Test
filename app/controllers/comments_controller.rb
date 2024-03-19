class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @comments = policy_scope(Comment).order(created_at: :desc)
    @comment = Comment.new
    authorize @comment
  end

  def new
    @comment = Comment.new
    authorize @comment
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to root_path
    else
      render :new
    end
    authorize @comment
  end

  def edit
  end

  def update
    @comment.update(comment_params)
    redirect_to root_path
    authorize @comment
  end

  def destroy
    @comment.destroy
    redirect_to root_path
    authorize @comment
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user)
  end
end
