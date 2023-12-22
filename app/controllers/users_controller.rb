class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def index
    
    role = current_user.role == 'user' ? 'vr_person' : 'user'
    @users = User.where(role: role)
  end


end
