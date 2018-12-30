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
    @comments = @speak.comments.order('created_at DESC')
  end
  
  def edit
    @speak = Speak.find(params[:id])
  end
  
  def update
    # if st_user_signed_in?　
    speak = Speak.find(params[:id])
    
      if current_st_user.id == speak.st_user_id
        speak.update(update_params)
      end
    # end
  end

  def destroy
    @speak = Speak.find(params[:id])
    if st_user_signed_in?
        @speak.destroy  if current_st_user.id == @speak.st_user_id
    end
  end
  

  private
  def create_params
    params.require(:speak).permit(:text,:field,:subject).merge(st_user_id: current_st_user.id)
  end
  
  def update_params
    params.require(:speak).permit(:text,:field,:subject)
  end
  
end
