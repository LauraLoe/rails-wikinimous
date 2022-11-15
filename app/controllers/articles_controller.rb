class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # List all
  def index
    @articles = Article.all
  end

  # List one
  def show
  end

  # Create new article
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
  end

  # Update an article
  def edit
  end

  def update
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  # Delete an article
  def destroy
    @article.destroy
    redirect_to articles_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
