class TopController < ApplicationController
  def index
    @speaks = Speak.all.order("created_at DESC")
  end
end
