class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_master_user,{only: [:index]}

  def index
    @users=User.all
  end

  def show
    @user=current_user
    @likes=Like.where(user_id: @user.id).order(created_at: :desc)
  end

end
