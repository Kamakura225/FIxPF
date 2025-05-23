# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:new, :create]
  before_action :block_if_user_signed_in
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #  devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def after_sign_in_path_for(resource)
    admin_places_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end



  private

  def block_if_user_signed_in
    if user_signed_in?
      flash[:alert] = "ユーザーとしてログイン中は管理者ログインできません。"
      redirect_to root_path
    end
  end
end
