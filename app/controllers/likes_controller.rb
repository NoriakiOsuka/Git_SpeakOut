class LikesController < ApplicationController
before_action :set_speak, only: [:create, :destroy]
  def create
     if ad_user_signed_in?
       @speak = Speak.find(params[:speak_id])
         unless @speak.adiine?(current_ad_user)
           @speak.adiine(current_ad_user)
           @speak.reload
             respond_to do |format|
             format.html { redirect_to request.referrer || root_url }
             format.js
             end
         end
    elsif st_user_signed_in?
       @speak = Speak.find(params[:speak_id])
        unless @speak.stiine?(current_st_user)
         @speak.stiine(current_st_user)
         @speak.reload
         respond_to do |format|
             format.html { redirect_to request.referrer || root_url }
             format.js
             end
        end
     end
  end

  def destroy
    if ad_user_signed_in?
    @speak = Like.find(params[:id]).speak
     if @speak.adiine?(current_ad_user)
        @speak.aduniine(current_ad_user)
        @speak.reload
        respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
       end
     end
    elsif st_user_signed_in?
    @speak = Like.find(params[:id]).speak
     if @speak.stiine?(current_st_user)
        @speak.stuniine(current_st_user)
        @speak.reload
        respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
       end
     end
    end
  end

private

  def set_speak
    @speak = Speak.find(params[:speak_id])
  end

  
end
