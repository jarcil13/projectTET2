class Api::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :destroy_session ,:authenticate_user_from_token!

  def destroy_session
    request.session_options[:skip] = true
  end

    private
       def authenticate_user_from_token!
         if !params['api_token']
          error = {
            error: "No 'api_token' given in params, Authorization need it.",
            code: 400
          }
          render :json => error, :status => :bad_params
         else
           @user = nil
           User.find_each do |u|
             if Devise.secure_compare(u.api_token, params['api_token'])
               @user = u
             end
            end
            erro2 = {
            error: "INVALID API TOKEN, CHECK",
            code: 401
          }
            if @user == nil
              render :json => erro2, :status => :unauthorizated
            end

         end
       end

end
