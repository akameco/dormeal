class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  private

  # セッションにデータがある場合現在のユーザを返す
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  # user_idパラメータがセッションにあればログイン状態を許可
  # viewとcontrollerで共通に使いたいためhelper_mathodを使い有効化
  def logged_in?
    !!session[:user_id]
  end

  def authenticate
    return if logged_in?
    redirect_to root_path, notice: 'ログインしてください'
  end
end
