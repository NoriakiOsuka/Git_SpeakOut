class TopController < ApplicationController
  def index
    @speaks = Speak.all.order('likes_count DESC')
    @contents = Speak.all.order("created_at DESC")
    
  end
end
