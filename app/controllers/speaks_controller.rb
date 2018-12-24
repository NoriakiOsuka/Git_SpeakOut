class SpeaksController < ApplicationController
  def new
    @speak = Speak.new
  end
  
  def create
    Speak.create(create_params)
  end

  private
  def create_params
    params.require(:speak).permit(:text,:field,:subject).merge(st_user_id: current_st_user.id)
  end

  
end
