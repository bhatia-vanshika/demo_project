class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
  	if current_user.present?
      if current_user.admin_user?
        admins_posts_path
      else
        users_posts_path
      end        
  	else
      new_user_session_path
  	end
  end
end
