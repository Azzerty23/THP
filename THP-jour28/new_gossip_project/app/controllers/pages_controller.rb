class PagesController < ApplicationController

  def welcome
    @gossips = Gossip.all
  end

  def login
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end