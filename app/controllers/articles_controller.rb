class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :destroy, :update, :show]
def home
   render 'home'
end
def index
  @articles = Article.all

end

def new
  @article = Article.new
end

def create
  @article = Article.new(article_params)

  if @article.save
    flash[:success] = "You have updated article"
    redirect_to article_path(@article)
  else
    flash[:error] = "You have NOT updated article"
    render 'new'
  end
end

def show

end

def edit

end

def update

  if @article.update(article_params)
    flash[:success] = "You have updated article"
    redirect_to article_path(@article)

  else

    end
    render 'edit'
  end

  def destroy
    @article.destroy
    flash[:success] = "You have delete article"

    redirect_to articles_path

  end

def article_params
  params.require(:article).permit(:title , :description)
end
def set_article
  @article = Article.find(params[:id])
end


end
