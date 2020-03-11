class SessionsController < ApplicationController

  def new
    @user = User.new
  end
  def create
    @user = User.find_by(email: params[:email])
  
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = 'Login success'
      redirect_to root_path
  
    else
      flash[:danger] = 'Utilisateur non reconnu'
      redirect_to login_path
    end
  end
  def destroy
    session.delete(:user_id)
    flash[:success] = "Session déconnectée"
    redirect_to login_path
  end

end
