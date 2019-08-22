class UsersController < ApplicationController

before_action :set_user ,only:[:edit,:update,:show,:distroy]
before_action :require_same_user , only:[:edit, :update,:distroy]

def index
  @users = User.all
end

def new
  @user = User.new
end

def create
  @user = User.new(user_params)
  if @user.save
    session[:user_id] = @user.id
    flash[:success] = "welcome to mytest#{@user.username}"
    redirect_to user_path(@user)
  else
    render 'new'

  end
end

def login
  flash[:success] = "user logged in"
end

def edit
end

def update
  if @user.update(user_params)
   flash[:success] = "your info has been updated"
   redirect_to articles_path
  else

    render 'edit'

  end
end


def show
end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
    flash[:success] = "user has been deleted"

  end


def set_user
  @user = User.find(params[:id])
end

def user_params
  params.require(:user).permit(:username,:email,:password)
end

def require_same_user
    if current_user != @user and !current_user.admin?
    flash[:danger] = "not allowed for this action"
    redirect_to root_path

  end
end


end
