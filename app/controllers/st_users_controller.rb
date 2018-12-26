class StUsersController < ApplicationController
  def show
    @st_user = StUser.find(params[:id])
  end
  
  def edit
     
  end
  
  def update
    current_st_user.update(update_params)
    redirect_to (st_user_path(current_st_user))
  end
  
  private
  def update_params
    params.require(:st_user).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :nickname, :school, :grade,:image)
  end
  
end
