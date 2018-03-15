class Api::FollowsController < ApplicationController

  def create

    @follow = Follow.new({
      follower_id: params[:followerId],
      followed_id: params[:followedId]
    })
    debugger

    if @follow.save

      @users = User.where(id: [params[:followerId], params[:followedId]])
      @activites = Activity.find_by_athletes_ids([params[:followerId], params[:followedId]])
      render 'api/users/index'
    else
      render json: {}, status: 422
    end
  end


  def destroy

    @follow = case

    @follow.destroy!
    @user = User.where(id: [params[:followerId], params[:followedId]])
    render 'api/users/show'
  end

end