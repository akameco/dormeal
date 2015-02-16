class Dormitory < ActiveRecord::Base
  validates :name, presence: true
  validates :menu_type, presence: true
  has_many :users
end
