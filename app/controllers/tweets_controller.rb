class TweetsController < ApplicationController
  before_action :authenticate_user!

  def create
    @tweet = current_user.tweets.build(tweet_params)

    @tweet.save
    redirect_to(
      root_path,
      notice: "Tweet created!"
    )
  end

  def destroy
    @tweet = current_user.tweets.find_by(id: params[:id])

    @tweet.destroy
    redirect_to(
      root_path,
      notice: "Tweet deleted!"
    )
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content, :photo)
  end
end
