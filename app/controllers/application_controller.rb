class ApplicationController < ActionController::Base

  def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys:[:family_name,:first_name,:family_name_kana,:first_name_kana,:nickname,:occupation,:position,:school,:grade])
  end
  
  def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys:[:family_name,:first_name,:family_name_kana,:first_name_kana,:nickname,:school,:grade,:occupation,:position])
  end
  

end
