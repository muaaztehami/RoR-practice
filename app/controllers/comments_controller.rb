class CommentsController < ApplicationController
  before_action :set_commentable, only: [:create, :destroy, :new]
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  #http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
 
  # def create
  #   @article = Article.find(params[:article_id])
  #   @comment = @article.comments.create(comment_params)
  #   redirect_to @article
  # end
  def new 
    @comment = current_user.comments.build(commentable: @commentable)
  end 
  # def index
  #   @comment = Comment.all
  # end

  def create 
    @comment = current_user.comments.create!(commentable: @commentable, body: comment_params[:body])
    #redirect_to @article
    redirect_to articles_path
  end

  def destroy 
    if params[:commentable_type] == 'Article'
      @article = Article.find(params[:article_id])

      @comment = @article.comments.find(params[:id])
      @comment.destroy
    else
      @comment = Comment.find(params[:comment_id])
      @subcomment = @comment.subcomments.find(params[:id])
      @subcomment.destroy
    end
    #redirect_to @article
    redirect_to articles_path
  end 

  private
    def comment_params
      params.require(:comment).permit(:body)
    end

    def set_commentable
      commentable_id = params["#{params[:commentable_type].underscore}_id"]
      @commentable = params[:commentable_type].constantize.find(commentable_id)
    end
end
