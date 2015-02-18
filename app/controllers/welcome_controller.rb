class WelcomeController < ApplicationController
  def index
    if logged_in?
      if current_user.dormitory
        # 今日のメニュー
        @today_menu = Menu.today_menu(current_user.dormitory.menu_type)
        # 明日のメニュー
        @tommorow_menu = Menu.tommorow_menu(current_user.dormitory.menu_type)
      else
        redirect_to dormitory_index_path, notice: '寮の設定をしてください'
      end
    end
  end
end
