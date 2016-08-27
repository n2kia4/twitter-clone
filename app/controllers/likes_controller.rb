class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet

  def create
    @like = @tweet.likes.create(user_id: current_user.id)
    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end

  def destroy
    @like = @tweet.likes.find_by(user_id: current_user.id).destroy
    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end
