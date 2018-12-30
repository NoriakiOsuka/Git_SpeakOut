class CommentsController < ApplicationController
  def new
    @speak = Speak.find(params[:speak_id])
    @comment = Comment.new
    @comment.speak_id = @speak.id
  end
  
  def create
    @comment = Comment.create(create_params)
  end
  
  def destroy
    @comment = Comment.find(params[:id])
     if ad_user_signed_in?
        @comment.destroy  if current_ad_user.id == @comment.ad_user.id
        redirect_to (speak_path(@comment.speak))
     end
     if st_user_signed_in?
        @comment.destroy  if current_st_user.id == @comment.st_user.id
        redirect_to (speak_path(@comment.speak))
     end
  end

  private
  def create_params
    if st_user_signed_in?
    params.require(:comment).permit(:text,:log_grade,:exp_grade,:cre_grade,:speak_id).merge(st_user_id: current_st_user.id)
    else ad_user_signed_in?
    params.require(:comment).permit(:text,:log_grade,:exp_grade,:cre_grade,:speak_id).merge(ad_user_id: current_ad_user.id)
    
    end
  end
end
