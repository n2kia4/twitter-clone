class UsersController < ApplicationController
  before_action :set_user

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

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :username, :description,
                                 :avatar, :location, :website_url)
  end
end
