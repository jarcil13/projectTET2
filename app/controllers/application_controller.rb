class ApplicationController < ActionController::Base 
  protected
    def after_sign_in_path_for(resource)
        home_show_path
    end
end
