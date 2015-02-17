class WelcomeController < ApplicationController
  def index
    if logged_in? && current_user.dormitory.nil?
      redirect_to dormitory_index_path, notice: '寮の設定をしてください'
    end
  end
end
