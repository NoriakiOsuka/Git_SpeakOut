class SpeaksController < ApplicationController
  def new
    @speak = Speak.new
  end
  
  def create
    @speak = Speak.create(create_params)
    unless @speak.save
    render action: :new
    end
  end
  
  def show
    @speak = Speak.find(params[:id])
  end

  private
  def create_params
    params.require(:speak).permit(:text,:field,:subject).merge(st_user_id: current_st_user.id)
  end

  
end
