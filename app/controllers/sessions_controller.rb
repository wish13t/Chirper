class SessionsController < ApplicationController
  def new
    render 'new'
  end

  def create
    user =User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have been Succesfully Loged In"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Problem with User Information"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
