class SearchController < ApplicationController
  before_action :authenticate_user!

  def show
    @tweets = Tweet.search(params[:search])
  end
end
