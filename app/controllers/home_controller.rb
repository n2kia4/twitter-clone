class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweet = current_user.tweets.build
  end
end
