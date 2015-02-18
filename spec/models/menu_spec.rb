require 'rails_helper'

RSpec.describe Menu, type: :model do
  describe '#menu_type' do
    it { is_expected.to validate_presence_of :menu_type }
  end

  describe '#open_day' do
    it { is_expected.to validate_presence_of :open_day }
  end
end
