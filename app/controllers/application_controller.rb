class ApplicationController < ActionController::Base

# before_action :configure_ad_user_parameters, if: :ad_users_controller? 
# before_action :configure_st_user_parameters, if: :st_users_controller? 

  def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys:[:family_name,:first_name,:family_name_kana,:first_name_kana,:nickname,:occupation,:position,:school,:grade])
     
  end
  
  def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys:[:family_name,:first_name,:family_name_kana,:first_name_kana,:nickname,:school,:grade,:occupation,:position])
  end
  

end
