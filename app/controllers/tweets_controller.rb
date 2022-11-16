class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy, :show]

  def index
    @tweet = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    if @tweet.user_id != current_user.id 
      redirect_to root_path
    end
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweet_path
    else
      render :edit
    end
  end

  def destroy
    @tweet.destroy
    redirect_to root_path
  end

  def show
  end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :text, :hashtag, :image).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
