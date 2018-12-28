class StUsersController < ApplicationController
  
  def show
    @st_user = StUser.find(params[:id])
  end
  
  def edit
    @st_user = StUser.find(params[:id])
    unless current_st_user.id == @st_user.id
    redirect_to (root_path)
    end
     
  end
  
  def update
    current_st_user.update(update_params)
    redirect_to (st_user_path(current_st_user))
  end
  
  def following
      @st_user  = StUser.find(params[:id])
      @st_users = @st_user.followings
      render 'show_follow'
  end

  def followers
    @st_user  = StUser.find(params[:id])
    @st_users = @st_user.followers
    render 'show_follower'
  end
  
  def crossfollowing
      @st_user  = StUser.find(params[:id])
      # @st_users = @st_user.crossfollows
      @crossfollows = Crossfollow.where(followable_id: @st_user.id)
      render 'show_crossfollow'
  end

  def crossfollowers
    @st_user  = StUser.find(params[:id])
    # @st_users = @st_user.crossfollows
    @crossfollows = Crossfollow.where(st_user_id: @st_user.id)
    render 'show_crossfollower'
  end
  
  
  private
  def update_params
    params.require(:st_user).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :nickname, :school, :grade,:image)
  end
  
end
