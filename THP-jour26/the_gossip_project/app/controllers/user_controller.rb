class UserController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:index, :show, :new, :create]
  
  def index
    @users = User.all
  end

  def show
    id = params['id']
    @user = User.find(id)
    @gossips = User.find(id).gossips
  end
end
