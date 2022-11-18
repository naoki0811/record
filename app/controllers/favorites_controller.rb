class FavoritesController < ApplicationController
  def create
    tweet = Tweet.find(params[:tweet_id])
    if user_signed_in?
      favorite = current_user.favorites.new(tweet_id: tweet.id)
      favorite.save
    else
      redirect_to tweet_path(tweet)
    end
  end
  
  def destroy
    tweet = Tweet.find(params[:tweet_id])
    if user_signed_in?
      favorite = current_user.favorites.find_by(tweet_id: tweet.id)
      favorite.destroy
    else
      redirect_to tweet_path(tweet)
    end
  end
end
