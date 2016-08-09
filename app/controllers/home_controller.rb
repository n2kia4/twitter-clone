class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweet = current_user.tweets.build
    @timeline = Tweet.where("user_id in (?) OR user_id = ?", current_user.following_ids, current_user).page(params[:page])
  end
end
