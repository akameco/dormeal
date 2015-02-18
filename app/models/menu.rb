class Menu < ActiveRecord::Base
  validates :menu_type, presence: true
  validates :open_day, presence: true
end
