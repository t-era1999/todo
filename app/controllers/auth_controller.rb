class AuthController < ApplicationController
  before_action :authenticate_user!

  def after_sign_in_path_for(_resources)
    tasks_path
  end

  def after_sign_out_path_for(_resources)
    new_user_session_path
  end
end