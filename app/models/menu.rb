class Menu < ActiveRecord::Base
  validates :menu_type, presence: true
  validates :open_day, presence: true
  scope :today_menu, -> (menu_type) { where(open_day: Date.today, menu_type: menu_type).first }
  scope :tommorow_menu, -> (menu_type) { where(open_day: Date.tomorrow, menu_type: menu_type).first }
end
