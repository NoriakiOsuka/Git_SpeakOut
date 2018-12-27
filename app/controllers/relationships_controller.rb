class RelationshipsController < ApplicationController
  def create
    @st_user = StUser.find(params[:relationship][:following_id])
    current_st_user.follow!(@st_user)
    redirect_to @st_user
  end

  def destroy
    @st_user = Relationship.find(params[:id]).following
    current_st_user.unfollow!(@st_user)
    redirect_to @st_user
  end
end
