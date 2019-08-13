class ArticlesController < ApplicationController


def index
  @articles = Article.all

end

def new
  @article = Article.new
end

def create
  @articles = Article.new(article_params)

  if @articles.save
    flash[:success] = "You have updated article"
    redirect_to article_path(@articles)
  else
    flash[:error] = "You have NOT updated article"
    render 'new'
  end
end

def show
  @article = Article.find(params[:id])

end

def edit
  @article = Article.find(params[:id])
end

def update
  @article = Article.find(params[:id])

  if @article.update(article_params)
    flash[:success] = "You have updated article"
    redirect_to article_path(@article)

  else

    end
    render 'edit'
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:success] = "You have delete article"

    redirect_to articles_path

  end

def article_params
  params.require(:article).permit(:title , :description)
end


end
