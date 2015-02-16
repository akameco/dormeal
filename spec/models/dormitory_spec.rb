require 'rails_helper'

RSpec.describe Dormitory, type: :model do
  it { is_expected.to have_many(:users).class_name('User') }

  describe '#name' do
    it { is_expected.to validate_presence_of :name }
  end

  describe '#menu_type' do
    it { is_expected.to validate_presence_of :menu_type }
  end
end
