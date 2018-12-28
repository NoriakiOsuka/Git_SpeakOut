class CrossfollowsController < ApplicationController
  
  
  def create
    if ad_user_signed_in?
    @st_user = StUser.find(params[:crossfollow][:st_user_id])
    # current_ad_user.stcrossfollow!(@st_user)
    Crossfollow.create!(followable_id: current_ad_user.id, followable_type: "ad_user", st_user_id: @st_user.id)
    redirect_to @st_user
    elsif st_user_signed_in?
    @ad_user = AdUser.find(params[:crossfollow][:ad_user_id])
    # current_st_user.adcrossfollow!(@ad_user)
    Crossfollow.create!(followable_id: current_st_user.id, followable_type: "st_user", ad_user_id: @ad_user.id)
    redirect_to @ad_user
    else
    end
  end

  def destroy
    if ad_user_signed_in?
    @st_user = StUser.find(params[:crossfollow][:st_user_id])
    current_ad_user.stcrossunfollow!(@st_user)
    redirect_to @st_user
    elsif st_user_signed_in?
    @ad_user = AdUser.find(params[:crossfollow][:ad_user_id])
    current_st_user.adcrossunfollow!(@ad_user)
    redirect_to @ad_user
    else
    end
  end
end
