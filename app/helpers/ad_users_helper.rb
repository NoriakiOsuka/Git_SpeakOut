module AdUsersHelper
  def current_ad_user?(ad_user)
     ad_user == current_ad_user
  end
  
  def current_st_user?(st_user)
     st_user == current_st_user
  end
end
