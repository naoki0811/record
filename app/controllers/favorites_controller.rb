class FavoritesController < ApplicationController
  before_action :set_tweet, only: [:create, :destroy]

  def create
    if user_signed_in?
      favorite = current_user.favorites.new(tweet_id: tweet.id)
      favorite.save
    else
      redirect_to tweet_path(tweet)
    end
  end

  def destroy
    if user_signed_in?
      favorite = current_user.favorites.find_by(tweet_id: tweet.id)
      favorite.destroy
    else
      redirect_to tweet_path(tweet)
    end
  end

  private

  def set_tweet
    tweet = Tweet.find(params[:tweet_id])
  end
end
