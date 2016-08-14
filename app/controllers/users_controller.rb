class UsersController < ApplicationController
  before_action :set_user
  before_action :correct_user, only: [:edit, :update]
  before_action :authenticate_user!

  def show
    @tweets = @user.tweets.page(params[:page])
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:notice] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def following
    @title = "Following"
    @users = @user.following.page(params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @users = @user.followers.page(params[:page])
    render 'show_follow'
  end

  private

  def set_user
    @user = User.find_by_username!(params[:username])
  end

  def correct_user
    if @user != current_user
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :username, :description,
                                 :avatar, :location, :website_url)
  end
end
