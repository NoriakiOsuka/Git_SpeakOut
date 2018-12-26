class AdUsersController < ApplicationController
  def show
    @ad_user = AdUser.find(params[:id])
  end
  
  def edit
  end
  
  def update
    current_ad_user.update(update_params)
    redirect_to (ad_user_path(current_ad_user))
  end
  
  private
  def update_params
    params.require(:ad_user).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :nickname, :occupation, :position,:image)
  end
  
end