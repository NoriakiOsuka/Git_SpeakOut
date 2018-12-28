class AdUsersController < ApplicationController
  def show
    @ad_user = AdUser.find(params[:id])
  end
  
  def edit
    @ad_user = AdUser.find(params[:id])
    unless current_ad_user.id == @ad_user.id
    redirect_to (root_path)
    end
  end
  
  def update
    current_ad_user.update(update_params)
    redirect_to (ad_user_path(current_ad_user))
  end
  
  def crossfollowing
      @ad_user  = AdUser.find(params[:id])
      # @ad_users = @ad_user.crossfollows
      @crossfollows = Crossfollow.where(followable_id: @ad_user.id)
      render 'show_crossfollow'
  end

  def crossfollowers
    @ad_user  = AdUser.find(params[:id])
    # @ad_users = @ad_user.crossfollows
    @crossfollows = Crossfollow.where(ad_user_id: @ad_user.id)
    render 'show_crossfollower'
  end
  
  private
  def update_params
    params.require(:ad_user).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :nickname, :occupation, :position,:image)
  end
  
end
