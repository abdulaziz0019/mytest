class CategoriesController < ApplicationController


before_action :set_category,only:[:show,:edit,:destroy,:update]
before_action :require_admin, only:[:new,:create,:destroy,:update,:edit]

def index
  @categories = Category.paginate(page: params[:page], per_page: 5)
end

def new
  @category = Category.new
end

def create
  @category  = Category.new(all_params)
    @category .save
    redirect_to categories_path
end

def show
  @category = Category.find(params[:id])
  @article_categories = @category.articles.paginate(page: params[:page], per_page:4)
end

def edit

end
def update
  if @category.update(all_params)
    redirect_to category_path(@category)
  else
    render 'edit'
  end
end

def destroy
end

private

def all_params
  params.require(:category).permit(:name)
end
def set_category
  @category = Category.find(params[:id])
end


private
def require_admin
  if !logged_in || (logged_in and !current_user.admin?)
    flash[:danger] = "you arent allowed to access this page"
    redirect_to categories_path

  end
end
end
