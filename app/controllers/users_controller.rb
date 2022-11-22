class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def show
    @user = User.find(params[:id])
    @following_users = @user.following_user
    @follower_users = @user.follower_user
    @tweets = @user.tweets
    @tweets = @user.tweets.page(params[:page]).per(4).order("created_at DESC")
  end

  def follows
    user = User.find(params[:id])
    @users = user.following_user
  end

  def followers
    user = User.find(params[:id])
    @users = user.follower_user
  end
end

private

def user_params
  params.require(:user).permit(:nickname, :profile, :profile_image)
end
