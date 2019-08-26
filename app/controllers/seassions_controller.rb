class SeassionsController < ApplicationController

  def new
    if session[:user_id] != nil
    redirect_to root_path
  end
  end

  def create
# find the user, by email compared to param[:seassion][:email]
    user = User.find_by(email: params[:seassion][:email])
    # if user exists then auth by user,auth(params[seassion and password])
    if user && user.authenticate(params[:seassion][:password])
      #save the id in seassion if user exists
      session[:user_id] = user.id
      flash[:success]= "you have logged in"
      redirect_to user_path(user)
    else

      flash.now[:danger] = "wrong data"
      render 'new'

    end
  end

  def destroy
  session[:user_id] = nil
  flash[:success] = "you are logout"
  render 'new'

  end


end
