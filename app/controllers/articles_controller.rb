class ArticlesController < ApplicationController
  before_action :find_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(task_params)

    redirect_to task_path(@task)
  end

  def edit; end

  def update
    @article.update(article_params)
    # No need for app/views/restaurants/update.html.erb
    redirect_to article_path(@article)
  end

  def find
  end

  def destroy
    @task.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to articles_path, status: :see_other
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
